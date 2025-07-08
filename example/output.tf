output "rest_api_invoke_url" {
  description = "Invoke URL for the REST API /ping endpoint"
  value       = var.enable_rest_api ? "https://${module.apigateway.rest_api_id}.execute-api.${var.region}.amazonaws.com/${var.rest_stage_name}/ping" : null
}

output "http_api_invoke_url" {
  description = "Base invoke URL for HTTP API"
  value       = var.enable_http_api ? module.apigateway.http_api_url : null
}

output "websocket_api_invoke_url" {
  description = "Base invoke URL for WebSocket API"
  value       = var.enable_websocket_api ? module.apigateway.websocket_api_url : null
}
