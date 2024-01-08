output "api_url" {
  value       = aws_api_gateway_stage.api_stage.invoke_url
  description = "The URL of the API Gateway"
}

output "deployment_bucket" {
  value = module.client_website_deployment_bucket.deployment_bucket
}

output "s3_bucket_website_url_domain" {
  value = module.client_website_deployment_bucket.s3_bucket_website_url_domain
}

output "aws_region" {
  value = var.aws_region
}
