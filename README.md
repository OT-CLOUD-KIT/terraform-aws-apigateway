# API Gateway

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/200x100/https://www.opstree.com/images/og_image8.jpg
  - This terraform module will create a API Gateway.
  - This project is a part of opstree's ot-aws initiative for terraform modules.


## Usage

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

## Local tags are used to define common tags. 
locals {
  tags = { "Environment" : "test", "Client" : "DevOps", "Project" : "Demo", "Organisation" : "opstree" }
}

#Create simple Redis cluster with one node in disabled mode.
module "APIGateway" {
  source = "./"
  rest_api_name = var.rest_api_name
  binary_media_types = ["image/jpeg", "image/png"]
  description = var.description

  types = ["EDGE"]
  enable_websocket_api   = false
  enable_rest_api = true
}

```

## Inputs

| Name | Description | Type | Default | Required | Supported |
|------|-------------|:----:|---------|:--------:|:---------:|
| rest_api_name | Name of the API Gateway created. | `string` | | yes | |
| enable_rest_api | To create api gateway. | `bool` | | yes | |
| types | List of endpoint types. This resource currently only supports managing a single value | `string` | | yes | |
| description | Description of the REST API.| `string` |  | |
| binary_media_types | List of binary media types supported by the REST API. | `string` |  | yes | |
| websocket_api_name | Name of the WebSocket API | `string` |  | |
| websocket_api_protocol | Type of the WebSocket API Protocol. |`string` | `WEBSOCKET` | yes | |
| websocket_api_route_selection_expression | WebSocket API Route Selection Eexpression. | `string` | yes | |
| enable_websocket_api | To enble websocket. | `bool` | `true/false` |
#

## Outputs

| Name | Description |  
|------|-------------| 
| api_gateway_id | The ID of API GateWay. | 
| root_resource_id | Set to the ID of the API Gateway Resource on the found REST API where the route matches '/'. | 
| websocket_api_id | The ID of the WebSocket API. | 


#
## Contributors
