module "api" {
  source                = "../api"
  api_name              = var.api_name
  cognito_user_pool_arn = var.cognito_user_pool_arn
}

module "client_website_deployment_bucket" {
  source      = "../client/terraform"
  environment = var.environment
}

module "shared_resources" {
  source     = "../features/shared"
  aws_region = var.aws_region
}

