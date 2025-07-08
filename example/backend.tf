terraform {
  backend "s3" {
    bucket = "ot-cloud-kit-bucket"
    key    = "ot/module/api-gateway/terraform.tfstate"
    region = "us-east-1"

  }
}