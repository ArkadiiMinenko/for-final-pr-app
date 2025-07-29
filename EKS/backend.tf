terraform {
  backend "s3" {
    bucket  = "arkadii-terraform-state-bucket"
    key     = "eks/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}
