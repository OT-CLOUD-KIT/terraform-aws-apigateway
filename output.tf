output "api_gateway_id" {
  description = "The ID of API GateWay"
  value       = var.enable_rest_api == true ? aws_api_gateway_rest_api.rest_api.*.id[0] : 0
}

output "root_resource_id" {
  description = "Set to the ID of the API Gateway Resource on the found REST API where the route matches '/'."
  value = var.enable_rest_api == true ? aws_api_gateway_rest_api.rest_api.*.root_resource_id[0] : 0
}

output "websocket_api_id" {
  description = "The ID of the WebSocket API"
  value       = var.enable_websocket_api == true ? aws_apigatewayv2_api.websocket_api.*.id[0] : 0
}
