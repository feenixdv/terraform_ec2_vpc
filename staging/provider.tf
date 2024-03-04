terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }


backend "s3" {
  bucket = "terrabackup"
  key    = "staging/tfstate"
  region = "us-east-1" # Replace with your desired region
}
}


