variable "environment" {
  default = "dev"
}

variable "api_name" {
  nullable = false
}

variable "cognito_user_pool_arn" {
  nullable = false
}

variable "aws_region" {
  default = "us-west-2"
}
