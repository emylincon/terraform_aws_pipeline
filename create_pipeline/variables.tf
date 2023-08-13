
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

# Example of a list variable
variable "availability_zones" {
  default = ["us-west-2a", "us-west-2b"]
}

variable "cidr_block" {
  default = "10.1.0.0/16"
}

variable "env" {
  description = "Targeted Deployment environment"
  default     = "Development"
}

variable "python_project_repository_branch" {
  description = "Python Project Repository branch to connect to"
  default     = "main"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "emeka18-cicd-artifacts-bucket"
}

variable "container_port" {
  description = "python app container port"
  default     = 5002
}


variable "container_name" {
  default = "python-app"
}

variable "ecs_image_ami" {
  type    = string
  default = "ami-072aaf1b030a33b6e"
  # run the following command to get the image ami for your region
  # aws ssm get-parameters --names /aws/service/ecs/optimized-ami/amazon-linux-2/recommended
}
