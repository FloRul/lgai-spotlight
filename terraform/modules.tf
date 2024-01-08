module "embedding_inference_resources" {
  source        = "./api_resources/embedding_inference"
  api_id        = aws_api_gateway_rest_api.api.id
  parent_id     = aws_api_gateway_rest_api.api.root_resource_id
  authorizer_id = aws_api_gateway_authorizer.cognito_authorizer.id
}

module "client_website_deployment_bucket" {
  source      = "../client/terraform"
  environment = var.environment
}