variable "environment" {
  default = "dev"
  type    = string
}

variable "bucket_name_prefix" {
  description = "The prefix for the S3 bucket name"
  type        = string
  default     = "lgai-spotlight-client-deployment"
}

variable "principal_identifiers" {
  description = "The AWS users or roles that the policy applies to"
  type        = list(string)
  default     = ["arn:aws:iam::446872271111:user/terraform-provisionner"]
}

variable "policy_actions" {
  description = "The actions that the policy allows on the deployment bucket"
  type        = list(string)
  default = [
    "s3:PutObject",
    "s3:GetObject",
    "s3:DeleteObject",
    "s3:ListBucket",
    "s3:PutBucketWebsite",
    "s3:GetBucketWebsite",
    "s3:DeleteBucketWebsite"
    "s3:PutBucketPolicy",
  ]
}
