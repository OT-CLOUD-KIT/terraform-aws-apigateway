variable "region" {
  description = "AWS region"
  type        = string
}

variable "enable_rest_api" {
  description = "Enable REST API"
  type        = bool
  default     = false
}

variable "enable_http_api" {
  description = "Enable HTTP API (v2)"
  type        = bool
  default     = false
}

variable "enable_websocket_api" {
  description = "Enable WebSocket API (v2)"
  type        = bool
  default     = false
}

variable "rest_api_name" {
  description = "Name of the REST API"
  type        = string
  default     = "rest-api"
}

variable "rest_api_endpoint_types" {
  description = "Endpoint types for REST API (e.g. EDGE, PRIVATE)"
  type        = list(string)
  default     = ["EDGE"]
}

variable "rest_stage_name" {
  description = "Stage name for REST API"
  type        = string
  default     = "dev"
}

variable "binary_media_types" {
  description = "Binary media types for REST API"
  type        = list(string)
  default     = []
}

variable "http_api_name" {
  description = "Name of the HTTP API"
  type        = string
  default     = "http-api"
}

variable "http_stage_name" {
  description = "Stage name for HTTP API"
  type        = string
  default     = "dev"
}

variable "http_api_integration_type" {
  description = "Integration type for HTTP API: LAMBDA or HTTP"
  type        = string
  default     = "LAMBDA"
}

variable "http_api_lambda_arn" {
  description = "Lambda ARN to integrate with HTTP API (if LAMBDA type)"
  type        = string
  default     = ""
}

variable "http_api_backend_url" {
  description = "Backend HTTP URL (if HTTP type)"
  type        = string
  default     = ""
}

variable "websocket_api_name" {
  description = "Name of the WebSocket API"
  type        = string
  default     = "websocket-api"
}

variable "websocket_stage_name" {
  description = "Stage name for WebSocket API"
  type        = string
  default     = "dev"
}

variable "websocket_api_route_selection_expression" {
  description = "Route selection expression for WebSocket API"
  type        = string
  default     = "$request.body.action"
}

variable "access_log_arn" {
  description = "CloudWatch Log Group ARN for access logging"
  type        = string
  default     = ""
}

variable "log_format" {
  description = "Access log format"
  type        = string
  default     = "$context.requestId"
}

variable "description" {
  description = "Description of the API"
  type        = string
  default     = ""
}


################### Naming convention variables ###################

variable "env" {
  type = string
  default = "dev"
  
}

variable "owner" {
  type = string
  default = "opstree"
}

variable "app" {
  type = string
  default = "otcloud-kit"
  
}
