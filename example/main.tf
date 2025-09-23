
module "apigateway" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-apigateway.git?ref=Feature"

  enable_rest_api      = var.enable_rest_api
  enable_http_api      = var.enable_http_api
  enable_websocket_api = var.enable_websocket_api

  rest_api_endpoint_types = var.rest_api_endpoint_types
  binary_media_types = var.binary_media_types

  http_stage_name           = var.http_stage_name
  http_api_integration_type = var.http_api_integration_type
  http_api_lambda_arn       = var.http_api_lambda_arn
  http_api_backend_url      = var.http_api_backend_url
  owner   = var.owner
  app                       = var.app
  env                       = var.env
  websocket_stage_name                     = var.websocket_stage_name
  websocket_api_route_selection_expression = var.websocket_api_route_selection_expression

  access_log_arn = var.access_log_arn
  log_format     = var.log_format

  description = var.description
}
