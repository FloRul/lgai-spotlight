output "s3_bucket_website_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
}

output "deployment_bucket" {
  value = aws_s3_bucket.client_deployment_bucket.id
}
