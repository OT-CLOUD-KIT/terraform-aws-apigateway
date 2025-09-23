# Terraform AWS API Gateway Module

This Terraform module provides a flexible and reusable way to provision **Amazon API Gateway** resources on AWS, supporting both **REST (v1)** and **HTTP/WebSocket (v2)** APIs.

It enables seamless integration with AWS Lambda or HTTP backends, and includes features like:

- Support for REST, HTTP, and WebSocket APIs  
- Integration with AWS Lambda and external HTTP backends  
- Automatic stage creation with access logging  

---

## Architecture
![image](https://github.com/user-attachments/assets/2d5a251a-a84e-4280-8c1e-332a67836824)


> The module allows creating REST, HTTP, and WebSocket APIs independently or together, with optional integration to Lambda or HTTP backends.

---

## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|

---

## Usage

```hcl

module "api_gateway" {
  source = "OT-CLOUD-KIT/terraform-aws-apigateway"

  # Enable APIs
  enable_rest_api      = true
  enable_http_api      = true
  enable_websocket_api = false

  # REST API (v1)
  rest_api_name             = "my-rest-api"
  rest_api_endpoint_types   = ["EDGE"]
  rest_stage_name           = "dev"
  binary_media_types        = ["application/octet-stream"]
  description               = "REST API for demo"

  # HTTP API (v2)
  http_api_name             = "my-http-api"
  http_stage_name           = "prod"
  http_api_integration_type = "LAMBDA"
  http_api_lambda_arn       = "arn:aws:lambda:us-east-1:111122223333:function:demo-api"

  # WebSocket API (v2)
  websocket_api_name                        = "my-ws-api"
  websocket_stage_name                      = "dev"
  websocket_api_route_selection_expression  = "$request.body.action"
}

```

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_rest_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_method](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_apigatewayv2_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_apigatewayv2_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) | resource |
| [aws_apigatewayv2_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) | resource |
| [aws_apigatewayv2_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) | resource |
| [aws_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |


##  Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_rest_api"></a> [enable\_rest\_api](#input\_enable\_rest\_api) | Enable REST API Gateway | `bool` | `false` | yes |
| <a name="input_enable_http_api"></a> [enable\_http\_api](#input\_enable\_http\_api) | Enable HTTP API Gateway (v2) | `bool` | `false` | yes |
| <a name="input_enable_websocket_api"></a> [enable\_websocket\_api](#input\_enable\_websocket\_api) | Enable WebSocket API Gateway | `bool` | `false` | yes |
| <a name="input_rest_api_name"></a> [rest\_api\_name](#input\_rest\_api\_name) | Name of the REST API | `string` | `""` | yes |
| <a name="input_rest_stage_name"></a> [rest\_stage\_name](#input\_rest\_stage\_name) | Stage name for REST API | `string` | `"dev"` | yes |
| <a name="input_rest_api_endpoint_types"></a> [rest\_api\_endpoint\_types](#input\_rest\_api\_endpoint\_types) | Endpoint types for REST API (e.g. EDGE, PRIVATE) | `list(string)` | `["EDGE"]` | no |
| <a name="input_binary_media_types"></a> [binary\_media\_types](#input\_binary\_media\_types) | Binary media types supported by REST API | `list(string)` | `[]` | no |
| <a name="input_http_api_name"></a> [http\_api\_name](#input\_http\_api\_name) | Name of the HTTP API | `string` | `""` | no |
| <a name="input_http_stage_name"></a> [http\_stage\_name](#input\_http\_stage\_name) | Stage name for HTTP API | `string` | `"dev"` | no |
| <a name="input_http_api_integration_type"></a> [http\_api\_integration\_type](#input\_http\_api\_integration\_type) | Integration type for HTTP API (e.g. HTTP, AWS_PROXY) | `string` | `"HTTP"` | no |
| <a name="input_http_api_backend_url"></a> [http\_api\_backend\_url](#input\_http\_api\_backend\_url) | Backend URL for HTTP API if integration type is HTTP | `string` | `""` | no |
| <a name="input_http_api_lambda_arn"></a> [http\_api\_lambda\_arn](#input\_http\_api\_lambda\_arn) | Lambda ARN for HTTP API if integration type is AWS_PROXY | `string` | `""` | no |
| <a name="input_websocket_api_name"></a> [websocket\_api\_name](#input\_websocket\_api\_name) | Name of the WebSocket API | `string` | `""` | no |
| <a name="input_websocket_stage_name"></a> [websocket\_stage\_name](#input\_websocket\_stage\_name) | Stage name for WebSocket API | `string` | `"dev"` | no |
| <a name="input_websocket_api_route_selection_expression"></a> [websocket\_api\_route\_selection\_expression](#input\_websocket\_api\_route\_selection\_expression) | Route selection expression for WebSocket API | `string` | `"$request.body.action"` | no |
| <a name="input_access_log_arn"></a> [access\_log\_arn](#input\_access\_log\_arn) | ARN of the CloudWatch log group for access logging | `string` | `""` | no |
| <a name="input_log_format"></a> [log\_format](#input\_log\_format) | Format string for access logging | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the API Gateway | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources | `map(string)` | `{}` | no |

---

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rest_api_id"></a> [rest\_api\_id](#output\_rest\_api\_id) | The ID of the REST API |
| <a name="output_rest_stage_invoke_url"></a> [rest\_stage\_invoke\_url](#output\_rest\_stage\_invoke\_url) | Invoke URL of the REST API stage |
| <a name="output_http_api_id"></a> [http\_api\_id](#output\_http\_api\_id) | The ID of the HTTP API |
| <a name="output_http_api_url"></a> [http\_api\_url](#output\_http\_api\_url) | Invoke URL of the HTTP API |
| <a name="output_websocket_api_id"></a> [websocket\_api\_id](#output\_websocket\_api\_id) | The ID of the WebSocket API |
| <a name="output_websocket_api_url"></a> [websocket\_api\_url](#output\_websocket\_api\_url) | WebSocket API endpoint URL |


## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)
