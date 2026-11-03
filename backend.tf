terraform {
  backend "s3" {
    bucket              = "terraform-state-bkt-manoj"
    key                 = "terraform.tfstate"
    region              = "us-east-1"
    use_lockfile        = true
    allowed_account_ids = ["674172270747"]
  }
}
