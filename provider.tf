# Defining AWS as our provider
provider "aws" {
  access_key = "<USE YOUR OWN TO TEST>"
  secret_key = "<USE YOUR OWN TO TEST>"
  region = var.aws_region
}