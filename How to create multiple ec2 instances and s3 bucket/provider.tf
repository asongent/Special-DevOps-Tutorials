 terraform {
    required_providers {
        aws = { 
            source = "hashicorp/aws"
            version = "~> 3.0"  # 3.0 is the terraform version during this tutorial. Veryify the current version.
        }
    }
}
 
 provider "aws" {
     access_key = "aws_access_key"
     secret_key = "aws_secret_key"
     region = "us-east-1"
     
 }