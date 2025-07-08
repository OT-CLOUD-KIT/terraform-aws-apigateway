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
  description = "Environment short name. Must be one of: d (dev), p (prod), q (qa), s (stage), g (global)."
  type        = string
  default     = "d"
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "bu" {
  description = "Business unit name (e.g., pcs, ultrasound). Max 5 characters."
  type        = string
  default     = "OT"
  validation {
    condition     = length(var.bu) <= 5
    error_message = "The business unit name must be less than or equal to 5 characters."
  }
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  default     = "BP"
  validation {
    condition     = length(var.app) <= 6
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "resource" {
  description = "Resource name (e.g., eks, efs, ecr). Max 8 characters."
  type        = string
  default     = "Network"
  validation {
    condition     = length(var.resource) <= 15
    error_message = "The resource name must be less than or equal to 8 characters."
  }
}

variable "tenant" {
  description = "Tenant name (e.g., app1, app2). Max 6 characters."
  type        = string
  default     = ""
  validation {
    condition     = length(var.tenant) <= 6
    error_message = "The tenant name must be less than or equal to 6 characters."
  }
}

variable "enabled_features" {
  type    = list(string)
  default = []
}

variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "random_alphanumeric_len" {
  description = "The length of random alphanumeric string desired. Min: 1, Max: 4."
  type        = number
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "The length must be between 1 and 4."
  }
}

variable "special" {
  description = "Include special characters like !@#$%&*()-_=+[]{}<>:? in the generated name."
  type        = bool
  default     = true
}

variable "upper" {
  description = "Include uppercase characters in the generated name."
  type        = bool
  default     = true
}

variable "number" {
  description = "Include numbers in the generated name."
  type        = bool
  default     = true
}

variable "gen_no_of_names" {
  description = "Number of names to generate."
  type        = number
  default     = 1
}

variable "team" {
  description = "The email address of the team who owns the application, ex:digitalops@gehealthcare.com"
  type        = string
  default     = "infra"
}

variable "program" {
  description = "Name of the Program, For ex: OT, BP etc."
  type        = string
  default     = "ot"
}

