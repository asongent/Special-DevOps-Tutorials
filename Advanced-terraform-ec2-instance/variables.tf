///////////////////////
#Variables for Provider
///////////////////////

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "ssh_key_name" {}

variable "region" {
    default = "us-east-1"
}

///////////////////////
# Variables for Resorces
///////////////////////

variable "instance_type" {
    default = "t2.micro"
}

variable "tags" {
    type = string
    default = "Server"
}

  
variable "ami" {
  type = string
  default = "ami-047a51fa27710816e"
}

//////////////////////////////
     #Keypair variables
//////////////////////////////

variable "private_key_path" {}
    
///////////////////
#VPC CIDR and Subnet
//////////////////

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}
variable "subnet1_cidr" {
  default = "172.16.0.0/24"
}

