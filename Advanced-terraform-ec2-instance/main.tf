///////////////////////////////////////////
                   #RESOURCES
///////////////////////////////////////////

#VPC
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = "true"
}

# INTERNET_GATEWAY
resource "aws_internet_gateway" "gateway1" {
  vpc_id = aws_vpc.vpc1.id
}

# ROUTE_TABLE
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway1.id
  }
}

resource "aws_route_table_association" "route-subnet1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table1.id
}

# SUBNET
resource "aws_subnet" "subnet1" {
  cidr_block = var.subnet1_cidr
  vpc_id = aws_vpc.vpc1.id
  map_public_ip_on_launch = "true"
}

# SECURITY_GROUP
resource "aws_security_group" "test-Instance" {
  name = "test.sg"
  vpc_id = aws_vpc.vpc1.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

#   ingress {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#EC2-Instance.
resource "aws_instance" "test" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.ssh_key_name
    subnet_id = aws_subnet.subnet1.id
    vpc_security_group_ids = [aws_security_group.test-Instance.id]
  
    tags = {
        Name = var.tags
        Env = "deployment"
    }  
        connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "honor"
    private_key = file(var.private_key_path)
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Output information to enable you see public ip and dns info so you can use it to ssh into the your ec2-instanace
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///// Output for ec2-nstance.test //// 

output "instance_DNS" {
  value = aws_instance.test.public_dns
}

output "public_ip" {
  value = aws_instance.test.public_ip
}

output "private_ip" {
  value = aws_instance.test.private_ip
}
 output "name" {
   value = aws_instance.test.tags.Name 
 }
 
