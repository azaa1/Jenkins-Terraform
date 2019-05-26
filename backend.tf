terraform {
  backend "s3" {
    region     = "us-east-2"
    bucket     = "akumosolutions"
    key        = "terraform/dev/terraform.tfstate"
    encrypt    = true
  }
}
