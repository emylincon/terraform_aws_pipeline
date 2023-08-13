variable "env_name" {
  description = "Name of environment"
  default     = "Development"
}

variable "aws_region" {
  description = "AWS region to provision"
  default     = "us-west-2"
}


variable "bucket_name" {
  description = "s3 bucket name"
  default     = "tf-state-bucket-emeka"
}
