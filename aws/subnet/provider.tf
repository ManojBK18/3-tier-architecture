provider "aws" {
  region = "ap-south-1"
}

terraform {
	required_providers {
		aws = {
	    version = "~> 6.45.0"
		}
  }
}
