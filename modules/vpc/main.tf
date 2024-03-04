resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_tag
    env  = var.env
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet
  availability_zone = "us-east-1a" # Replace with your desired AZ
  
  tags = {
    Name = "public-subnet"
    env  = var.env
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet
  availability_zone = "us-east-1b" # Replace with your desired AZ

  tags = {
    Name = "private-subnet"
    env  = var.env
  }
}

locals {
  ssh_port = 22 #For the security purpose
}

resource "aws_security_group" "all_ssh" {
  name        = "allow_ssh"
  description = "Allows SSH access from anywhere"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = local.ssh_port
    to_port   = local.ssh_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
    env  = var.env
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }
}

resource "aws_route_table_association" "public_subnet_route" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-gateway"
    env  = var.env
  }
}


