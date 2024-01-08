variable "environment" {
  default = "dev"
}

variable "api_name" {
  default = "lgai-spotlight-api"
}

variable "cognito_user_pool_arn" {
  default = "arn:aws:cognito-idp:us-west-2:446872271111:userpool/us-west-2_CazbibJW7"
}

variable "aws_region" {
  default = "us-west-2"
}
