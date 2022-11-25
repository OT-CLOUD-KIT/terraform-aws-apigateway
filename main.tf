resource "aws_api_gateway_rest_api" "rest_api" {
  count = var.enable_rest_api == true ? 1 : 0
  name  = var.rest_api_name
  binary_media_types = var.binary_media_types
  description        = var.description
  endpoint_configuration {
        types = var.types
    }
}

resource "aws_apigatewayv2_api" "websocket_api" {
  count                      = var.enable_websocket_api == true ? 1 : 0
  name                       = var.websocket_api_name
  protocol_type              = var.websocket_api_protocol
  route_selection_expression = var.websocket_api_route_selection_expression
}
