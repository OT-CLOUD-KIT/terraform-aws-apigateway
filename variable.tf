variable "rest_api_name" {
  type        = string
  description = "Name of the API Gateway created"
  default     = "terraform-api-gateway-example"
}

variable "enable_rest_api" {
  type    = bool
  default = true
}

variable "types" {
  description = "List of endpoint types."
  default = ["EDGE"]
}

variable "description" {
  description = "Description of the REST API."
  default = "API Service"
}

variable "binary_media_types" {
  description = "List of binary media types supported by the REST API."
  default = ["image/jpeg",]
}

variable "websocket_api_name" {
  type        = string
  description = "Name of the WebSocket API"
  default = "default"
}

variable "websocket_api_protocol" {
  type        = string
  description = "Type of the WebSocket API Protocol"
  default     = "WEBSOCKET"
}

variable "websocket_api_route_selection_expression" {
  type        = string
  description = "WebSocket API Route Selection Eexpression"
  default = "default"
}

variable "enable_websocket_api" {
  type    = bool
  default = false
}

