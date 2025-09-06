# Common
variable "description" {
  type        = string
  default     = "API Gateway managed by Terraform"
}

variable "access_log_arn" {
  type        = string
  default     = ""
}

variable "log_format" {
  type        = string
  default     = "{\"requestId\":\"$context.requestId\",\"ip\":\"$context.identity.sourceIp\",\"requestTime\":\"$context.requestTime\",\"httpMethod\":\"$context.httpMethod\",\"routeKey\":\"$context.routeKey\",\"status\":\"$context.status\"}"
}


# REST API (v1)
variable "enable_rest_api" {
  type    = bool
  default = false
}


variable "rest_api_endpoint_types" {
  type    = list(string)
  default = ["EDGE"]
}

variable "rest_stage_name" {
  type    = string
  default = "v1"
}

variable "binary_media_types" {
  type    = list(string)
  default = []
}


# HTTP API (v2)
variable "enable_http_api" {
  type    = bool
  default = false
}

variable "http_stage_name" {
  type    = string
  default = "$default"
}
# 

# WebSocket API (v2)
variable "enable_websocket_api" {
  type    = bool
  default = false
}


variable "websocket_stage_name" {
  type    = string
  default = "dev"
}

variable "websocket_api_route_selection_expression" {
  type    = string
  default = "$request.body.action"
}



variable "http_api_integration_type" {
  description = "Integration type for HTTP API: 'LAMBDA' or 'HTTP'"
  type        = string
  default     = "LAMBDA"
}

variable "http_api_lambda_arn" {
  description = "ARN of the Lambda function for HTTP API"
  type        = string
  default     = ""
}

variable "http_api_backend_url" {
  description = "HTTP backend URL (used when integration type is HTTP)"
  type        = string
  default     = ""
}



################################## Naming convention variables #########################################

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