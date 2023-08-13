terraform {
  required_version = ">= 0.12"
  # Uncomment only if you would like not to use s3 as backend
  backend "s3" {
    bucket = "tf-state-bucket-emeka"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_codecommit_repository" "code_repo" {
  repository_name = "MyPythonApp"
  description     = "This is a Sample python App Repository"
}

resource "null_resource" "image" {

  provisioner "local-exec" {
    command     = <<EOF
      git config --local credential.helper '!aws codecommit credential-helper $@'
      git config --local credential.UseHttpPath true
       git init
       git add .
       git commit -m "Initial Commit"
       git remote add origin ${aws_codecommit_repository.code_repo.clone_url_http}
       git push -u origin main
   EOF
    working_dir = "showcase_flask_app" #"python_app"
  }
  depends_on = [
    aws_codecommit_repository.code_repo,
  ]

}

resource "null_resource" "clean_up" {

  provisioner "local-exec" {
    when        = destroy
    command     = <<EOF
       rm -rf .git/
   EOF
    working_dir = "showcase_flask_app" #"python_app"

  }
}

resource "aws_s3_bucket" "cicd_bucket" {
  bucket        = var.artifacts_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "control" {
  bucket = aws_s3_bucket.cicd_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket_ownership_controls.control]

  bucket = aws_s3_bucket.cicd_bucket.id
  acl    = "private"
}
