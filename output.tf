output "rest_api_id" {
  value = aws_api_gateway_rest_api.rest_api[0].id
}

output "http_api_url" {
  value = aws_apigatewayv2_api.http_api[0].api_endpoint
}

output "websocket_api_url" {
  value = aws_apigatewayv2_api.websocket_api[0].api_endpoint
}


output "http_api_invoke_url" {
  value       = var.enable_http_api ? "${aws_apigatewayv2_api.http_api[0].api_endpoint}/ping" : null
  description = "Invoke URL for the HTTP API /ping route"
}
