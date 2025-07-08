########################
# REST API (Edge/Private)
########################
resource "aws_api_gateway_rest_api" "rest_api" {
  count              = var.enable_rest_api ? 1 : 0
  name               = "${local.base_name}-rest-api"
  description        = var.description
  binary_media_types = var.binary_media_types

  endpoint_configuration {
    types = var.rest_api_endpoint_types
  }

 tags = merge(
    {
      Name = "${local.base_name}-rest-api"
    },
    local.common_tags
  )
  } 

resource "aws_api_gateway_resource" "ping" {
  count       = var.enable_rest_api ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.rest_api[0].id
  parent_id   = aws_api_gateway_rest_api.rest_api[0].root_resource_id
  path_part   = "ping"
}

resource "aws_api_gateway_method" "ping_get" {
  count         = var.enable_rest_api ? 1 : 0
  rest_api_id   = aws_api_gateway_rest_api.rest_api[0].id
  resource_id   = aws_api_gateway_resource.ping[0].id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "ping_get_mock" {
  count                   = var.enable_rest_api ? 1 : 0
  rest_api_id             = aws_api_gateway_rest_api.rest_api[0].id
  resource_id             = aws_api_gateway_resource.ping[0].id
  http_method             = aws_api_gateway_method.ping_get[0].http_method
  integration_http_method = "GET"
  type                    = "MOCK"
}

resource "aws_api_gateway_deployment" "rest_deployment" {
  count       = var.enable_rest_api ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.rest_api[0].id

  triggers = {
    redeploy = timestamp()
  }

  depends_on = [
    aws_api_gateway_method.ping_get,
    aws_api_gateway_integration.ping_get_mock
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "rest_stage" {
  count         = var.enable_rest_api ? 1 : 0
  stage_name    = var.rest_stage_name
  rest_api_id   = aws_api_gateway_rest_api.rest_api[0].id
  deployment_id = aws_api_gateway_deployment.rest_deployment[0].id

  dynamic "access_log_settings" {
    for_each = var.access_log_arn != "" ? [1] : []
    content {
      destination_arn = var.access_log_arn
      format          = var.log_format
    }
  }


 tags = merge(
    {
      Name = "${local.base_name}"
    },
    local.common_tags
  )
}

########################
# HTTP API (v2)
########################
resource "aws_apigatewayv2_api" "http_api" {
  count         = var.enable_http_api ? 1 : 0
  name               = "${local.base_name}-http-api"
  protocol_type = "HTTP"

   tags = merge(
    {
      Name = "${local.base_name}-http-api"
    },
    local.common_tags
  )
}

resource "aws_apigatewayv2_stage" "http_stage" {
  count       = var.enable_http_api ? 1 : 0
  api_id      = aws_apigatewayv2_api.http_api[0].id
  name               = var.http_stage_name
  auto_deploy = true

  dynamic "access_log_settings" {
    for_each = var.access_log_arn != "" ? [1] : []
    content {
      destination_arn = var.access_log_arn
      format          = var.log_format
    }
  }

 tags = merge(
    {
      Name = "${local.base_name}-http-stage"
    },
    local.common_tags
  )
}


# Grant API Gateway permission to invoke Lambda
resource "aws_lambda_permission" "http_api_lambda_permission" {
  count         = var.enable_http_api && var.http_api_integration_type == "LAMBDA" ? 1 : 0
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.http_api_lambda_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api[0].execution_arn}/*/*"
}

resource "aws_apigatewayv2_integration" "http_api_integration" {
  count                     = var.enable_http_api ? 1 : 0
  api_id                    = aws_apigatewayv2_api.http_api[0].id
  integration_type          = var.http_api_integration_type == "LAMBDA" ? "AWS_PROXY" : "HTTP"
  integration_uri           = var.http_api_integration_type == "LAMBDA" ? var.http_api_lambda_arn : var.http_api_backend_url
  integration_method        = var.http_api_integration_type == "LAMBDA" ? "POST" : "GET"
  payload_format_version    = "2.0"
  timeout_milliseconds      = 30000
}

resource "aws_apigatewayv2_route" "http_api_ping_route" {
  count     = var.enable_http_api ? 1 : 0
  api_id    = aws_apigatewayv2_api.http_api[0].id
  route_key = "GET /ping"
  target    = "integrations/${aws_apigatewayv2_integration.http_api_integration[0].id}"
}

########################
# WebSocket API (v2)
########################
resource "aws_apigatewayv2_api" "websocket_api" {
  count                      = var.enable_websocket_api ? 1 : 0
  name               = "${local.base_name}-websocket-api"
  protocol_type              = "WEBSOCKET"
  route_selection_expression = var.websocket_api_route_selection_expression

   tags = merge(
    {
      Name = "${local.base_name}-websocket-api"
    },
    local.common_tags
  )
}

resource "aws_apigatewayv2_stage" "websocket_stage" {
  count       = var.enable_websocket_api ? 1 : 0
  api_id      = aws_apigatewayv2_api.websocket_api[0].id
  name               = var.websocket_stage_name
  auto_deploy = true

  dynamic "access_log_settings" {
    for_each = var.access_log_arn != "" ? [1] : []
    content {
      destination_arn = var.access_log_arn
      format          = var.log_format
    }
  }

 tags = merge(
    {
      Name = "${local.base_name}-websocket_stage"
    },
    local.common_tags
  )
  }

