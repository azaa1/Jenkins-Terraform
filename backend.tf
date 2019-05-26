terraform {
  backend "s3" {
    region     = "us-east-2"
    bucket     = "akumosolutions"
    key        = "terraform/test/terraform.tfstate"
    encrypt    = true
  }
}
