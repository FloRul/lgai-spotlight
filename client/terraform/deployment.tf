resource "aws_s3_bucket" "client_deployment_bucket" {
  bucket = "${var.bucket_name_prefix}-${var.environment}"
}

resource "aws_s3_bucket_policy" "deployment_bucket_policy_provisionner_allow_all" {
  bucket = aws_s3_bucket.client_deployment_bucket.id
  policy = data.aws_iam_policy_document.allow_all_for_provisioner.json
}

resource "aws_s3_bucket_policy" "deployment_bucket_policy_all_read" {
  depends_on = [aws_s3_bucket_policy.deployment_bucket_policy_provisionner_allow_all]
  bucket     = aws_s3_bucket.client_deployment_bucket.id
  policy     = data.aws_iam_policy_document.allow_public_read_of_deployment_dev_folder.json
}


data "aws_iam_policy_document" "allow_all_for_provisioner" {
  statement {
    principals {
      type        = "AWS"
      identifiers = var.principal_identifiers
    }
    sid    = "AllowAllForProvisioner"
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.client_deployment_bucket.arn}/*",
    ]

    actions = [
      "s3:*",
    ]
  }
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
      "${aws_s3_bucket.client_deployment_bucket.arn}/deployment/*"
    ]

    actions = [
      "s3:GetObject",
    ]
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
