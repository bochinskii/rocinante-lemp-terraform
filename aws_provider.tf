terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "bochinskii-rocinante-state"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {}

#provider "aws" {
#  region = "eu-central-1"
#  shared_credentials_files = ["~/.aws/credentials"]
#  profile = "default"
#}
