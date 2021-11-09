terraform {
  required_version = ">= 0.12"
}


provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-tf-state-bucket-emeka"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = var.env_name
  }
}
