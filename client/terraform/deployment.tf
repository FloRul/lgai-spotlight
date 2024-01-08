resource "aws_s3_bucket" "client_deployment_bucket" {
  bucket = "${var.bucket_name_prefix}-${var.environment}"
}

resource "aws_s3_bucket_policy" "deployment_bucket_policy" {
  bucket = aws_s3_bucket.client_deployment_bucket.id
  policy = data.aws_iam_policy_document.allow_public_read_of_deployment_dev_folder.json
}

data "aws_iam_policy_document" "allow_public_read_of_deployment_dev_folder" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    sid    = "AllowPublicReadOfDeploymentFolders"
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.client_deployment_bucket.arn}/deployment/dev/*"
    ]

    actions = [
      "s3:GetObject",
    ]
  }
  statement {
    principals {
      type        = "AWS"
      identifiers = var.principal_identifiers
    }
    sid    = "AllowAll"
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.client_deployment_bucket.arn}/*",
      "${aws_s3_bucket.client_deployment_bucket.arn}"
    ]

    actions = var.policy_actions
  }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.client_deployment_bucket.id

  index_document {
    suffix = "index.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "*/*"
    }
    redirect {
      replace_key_prefix_with = "deployment/dev/"
    }
  }
}

output "s3_bucket_website_url_domain" {
  value = aws_s3_bucket_website_configuration.website_config.website_domain
}
