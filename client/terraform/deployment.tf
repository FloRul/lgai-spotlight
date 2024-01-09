resource "aws_s3_bucket" "client_deployment_bucket" {
  bucket = "${var.bucket_name_prefix}-${var.environment}"
}

resource "aws_s3_bucket_policy" "deployment_bucket_policy_provisionner_allow_all" {
  bucket = aws_s3_bucket.client_deployment_bucket.id
  policy = data.aws_iam_policy_document.allow_all_for_provisioner.json
}

resource "aws_s3_bucket_policy" "deployment_bucket_policy_all_read" {
  bucket = aws_s3_bucket.client_deployment_bucket.id
  policy = data.aws_iam_policy_document.allow_public_read_of_deployment_dev_folder.json
}


data "aws_iam_policy_document" "allow_all_for_provisioner" {
  statement {
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.client_deployment_bucket.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = var.principal_identifiers
    }
  }
}

data "aws_iam_policy_document" "allow_public_read_of_deployment_dev_folder" {
  statement {
    resources = ["${aws_s3_bucket.client_deployment_bucket.arn}/deployment/*",
    "${aws_s3_bucket.client_deployment_bucket.arn}/deployment"]
    actions = ["s3:GetObject"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

# resource "aws_s3_bucket_website_configuration" "website_config" {
#   bucket = aws_s3_bucket.client_deployment_bucket.id

#   index_document {
#     suffix = "index.html"
#   }

#   routing_rule {
#     condition {
#       key_prefix_equals = "*/*"
#     }
#     redirect {
#       replace_key_prefix_with = "deployment/"
#     }
#   }
# }

resource "aws_s3_bucket_ownership_controls" "bucket_controls" {
  bucket = aws_s3_bucket.client_deployment_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket                  = aws_s3_bucket.client_deployment_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_controls,
    aws_s3_bucket_public_access_block.access_block,
  ]

  bucket = aws_s3_bucket.client_deployment_bucket.id
  acl    = "public-read"
}

# resource "aws_s3_bucket" "log_bucket" {
#   bucket = "my-tf-log-bucket"
# }

# resource "aws_s3_bucket_logging" "log" {
#   bucket        = aws_s3_bucket.client_deployment_bucket.id
#   target_bucket = aws_s3_bucket.log_bucket.id
#   target_prefix = "log/"
# }

resource "aws_cloudwatch_log_group" "log_group" {
  name = "${aws_s3_bucket.client_deployment_bucket.id}-logs"
}
