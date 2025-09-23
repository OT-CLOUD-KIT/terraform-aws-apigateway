region               = "us-east-1"
enable_rest_api      = true
enable_http_api      = true
enable_websocket_api = true
rest_api_endpoint_types = ["EDGE"]
rest_stage_name         = "dev"
binary_media_types      = ["*/*"]
http_stage_name           = "dev"
http_api_integration_type = "LAMBDA"
http_api_lambda_arn       = "arn:aws:lambda:us-east-1:557186391124:function:demo"
websocket_stage_name                     = "dev"
websocket_api_route_selection_expression = "$request.body.action"
access_log_arn = "" # Provide actual ARN of log group if needed
description    = "Example API Gateway setup using Terraform"

################## Naming Convension #####################

env = "dev"
owner = "opstree"
app = "otcloud-kit"

