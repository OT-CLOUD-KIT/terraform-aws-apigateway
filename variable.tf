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


###############333

################################## Naming convention variables #########################################

variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string
  default = "BP"
  validation {
    condition     = length(var.bu) <= 6
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
  default = "OT"
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  default = "network"
  validation {
    condition     = length(var.app) <= 10
    error_message = "The app name must be less than or equal to 10 characters."
  }
}

variable "env" {
  description = "Environment code: 'd' (dev), 'p' (prod), 'q' (qa), 's' (stage), 'g' (global)."
  type        = string
  default = "d"

  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
  default = "infra"
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
  default = "us-east-1"
}
