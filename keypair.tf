
# Generate an RSA private key
resource "tls_private_key" "app_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS EC2 Key Pair using the generated public key
resource "aws_key_pair" "app_key" {
  key_name   = "python-app-github-actions-key"
  public_key = tls_private_key.app_key.public_key_openssh

  tags = {
    Name        = "python-app-github-actions-key"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# Save the private key on the GitHub Actions runner
resource "local_file" "private_key" {
  content         = tls_private_key.app_key.private_key_pem
  filename        = "${path.module}/python-app-github-actions-key.pem"
  file_permission = "0600"
}
