variable "aws_region" {
  description = "AWS region — Ilsa Mukhtar project"
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Project identifier tag"
  type        = string
  default     = "flask-cicd-ilsamukhtar"
}
