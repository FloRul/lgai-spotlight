resource "aws_api_gateway_rest_api" "api" {
  name        = var.api_name
  description = "This is the API for the LGAI Spotlight application"
}

resource "aws_api_gateway_authorizer" "cognito_authorizer" {
  name          = "${var.api_name}_cognito_authorizer_${var.environment}"
  type          = "COGNITO_USER_POOLS"
  rest_api_id   = aws_api_gateway_rest_api.api.id
  provider_arns = [var.cognito_user_pool_arn]
}

resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on  = [module.embedding_inference_resources]
  rest_api_id = aws_api_gateway_rest_api.api.id
  description = "Deployment for ${timestamp()}"
  lifecycle {
    create_before_destroy = true
  }
  triggers = {
    redeployment = timestamp()
  }
}

resource "aws_iam_role" "api_gateway_cloudwatch" {
  name = "${var.api_name}_${var.environment}_cloudwatch_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "apigateway.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "api_gateway_cloudwatch_policy" {
  name = "${var.api_name}_${var.environment}_cloudwatch_policy"
  role = aws_iam_role.api_gateway_cloudwatch.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:PutLogEvents",
          "logs:GetLogEvents",
          "logs:FilterLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_api_gateway_account" "apigw_cloudwatch_account" {
  cloudwatch_role_arn = aws_iam_role.api_gateway_cloudwatch.arn
}

resource "aws_api_gateway_stage" "api_stage" {
  stage_name    = var.environment
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.api_deployment.id

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_log_group.arn
    format = jsonencode({
      requestId                    = "$context.requestId"
      ip                           = "$context.identity.sourceIp"
      requestTime                  = "$context.requestTime"
      httpMethod                   = "$context.httpMethod"
      routeKey                     = "$context.routeKey"
      status                       = "$context.status"
      protocol                     = "$context.protocol"
      responseLength               = "$context.responseLength"
      integrationLatency           = "$context.integrationLatency"
      integrationStatus            = "$context.integrationStatus"
      integrationErrorMessage      = "$context.integrationErrorMessage"
      error                        = "$context.error"
      errorMessage                 = "$context.errorMessage"
      errorString                  = "$context.errorString"
      errorReason                  = "$context.errorReason"
      errorFault                   = "$context.errorFault"
      errorCause                   = "$context.errorCause"
      errorDetails                 = "$context.errorDetails"
      errorDescription             = "$context.errorDescription"
      errorType                    = "$context.errorType"
      errorInfo                    = "$context.errorInfo"
      errorCauses                  = "$context.errorCauses"
      errorCausesFirst             = "$context.errorCausesFirst"
      errorCausesLast              = "$context.errorCausesLast"
      errorCausesLength            = "$context.errorCausesLength"
      errorCausesStatusCode        = "$context.errorCausesStatusCode"
      errorCausesErrorCode         = "$context.errorCausesErrorCode"
      errorCausesErrorMessage      = "$context.errorCausesErrorMessage"
      errorCausesErrorType         = "$context.errorCausesErrorType"
      errorCausesErrorReason       = "$context.errorCausesErrorReason"
      errorCausesErrorDetails      = "$context.errorCausesErrorDetails"
      errorCausesErrorDescription  = "$context.errorCausesErrorDescription"
      errorCausesErrorInfo         = "$context.errorCausesErrorInfo"
      errorCausesErrorCause        = "$context.errorCausesErrorCause"
      errorCausesErrorFault        = "$context.errorCausesErrorFault"
      errorCausesErrorString       = "$context.errorCausesErrorString"
      errorCausesErrorStatusCode   = "$context.errorCausesErrorStatusCode"
      errorCausesErrorErrorCode    = "$context.errorCausesErrorErrorCode"
      errorCausesErrorErrorMessage = "$context.errorCausesErrorErrorMessage"
      errorCausesErrorErrorType    = "$context.errorCausesErrorErrorType"
      errorCausesErrorErrorReason  = "$context.errorCausesErrorErrorReason"
      errorCausesErrorErrorDetails = "$context.errorCausesErrorErrorDetails"
    })
  }
}

resource "aws_cloudwatch_log_group" "api_log_group" {
  name              = "/aws/api-gw/${aws_api_gateway_rest_api.api.name}"
  retention_in_days = 7
}

resource "aws_api_gateway_usage_plan" "api_usage_plan" {
  name        = "${var.api_name}_${var.environment}_usage_plan"
  description = "API Usage Plan for ${var.api_name}"
  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_stage.api_stage.stage_name
  }
}
