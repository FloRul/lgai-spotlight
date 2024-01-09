resource "aws_api_gateway_resource" "embedding_inference_resource" {
  rest_api_id = var.api_id
  parent_id   = var.parent_id
  path_part   = "embedding_inference"
}

resource "aws_api_gateway_method" "embedding_inference_method" {
  rest_api_id   = var.api_id
  resource_id   = aws_api_gateway_resource.embedding_inference_resource.id
  http_method   = "ANY"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = var.authorizer_id
  request_parameters = {
    "method.request.header.Authorization" = true
  }
}

resource "aws_api_gateway_integration" "embedding_inference_integration" {
  rest_api_id             = var.api_id
  resource_id             = aws_api_gateway_resource.embedding_inference_resource.id
  http_method             = aws_api_gateway_method.embedding_inference_method.http_method
  integration_http_method = "POST"
  type                    = "MOCK"
  request_templates = {
    "application/json" = jsonencode(
      {
        statusCode = 200
      }
    )
  }
  # type                    = "AWS_PROXY"
  # uri                     = module.lambda_function_container_image.lambda_function_invoke_arn
}

resource "aws_api_gateway_method_response" "embedding_inference_200" {
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.embedding_inference_resource.id
  http_method = aws_api_gateway_method.embedding_inference_method.http_method
  status_code = 200
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin"  = true,
    "method.response.header.Access-Control-Allow-Headers" = true
  }
}

resource "aws_api_gateway_integration_response" "this" {
  depends_on  = [aws_api_gateway_integration.embedding_inference_integration]
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.embedding_inference_resource.id
  http_method = aws_api_gateway_method.embedding_inference_method.http_method
  status_code = aws_api_gateway_method_response.embedding_inference_200.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'*'",
    "method.response.header.Access-Control-Allow-Methods" = "'POST'",
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
  response_templates = {
    "application/json" = ""
  }
}

##########################################################################################
resource "aws_api_gateway_method" "options_method" {
  rest_api_id   = var.api_id
  resource_id   = aws_api_gateway_resource.embedding_inference_resource.id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "options_200" {
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.embedding_inference_resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  status_code = 200
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin"  = true,
    "method.response.header.Access-Control-Allow-Headers" = true
  }
}

resource "aws_api_gateway_integration" "options" {
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.embedding_inference_resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  type        = "MOCK"
  request_templates = {
    "application/json" = jsonencode(
      {
        statusCode = 200
      }
    )
  }
}

resource "aws_api_gateway_integration_response" "options_200" {
  depends_on  = [aws_api_gateway_integration.options]
  rest_api_id = var.api_id
  resource_id = aws_api_gateway_resource.embedding_inference_resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  status_code = aws_api_gateway_method_response.options_200.status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin"  = "'*'",
    "method.response.header.Access-Control-Allow-Methods" = "'OPTIONS'",
    "method.response.header.Access-Control-Allow-Headers" = "'*'"
  }
  response_templates = {
    "application/json" = ""
  }
}
