output "api_url" {
  value       = aws_api_gateway_rest_api.api.execution_arn
  description = "The URL of the API Gateway"
}

output "deployment_bucket" {
  value = module.client_website_deployment_bucket.deployment_bucket
}

output "s3_bucket_website_url_domain" {
  value = module.client_website_deployment_bucket.s3_bucket_website_url_domain
}
