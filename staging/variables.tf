variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  default = "10.0.2.0/24"
}

variable "ami_id" {
  default = "ami-0c7217cdde317cfec" # Replace with your AMI ID
}

variable "instance_type" {
  default = "t2.micro"
}

variable "team" {
  default = "Devops"
}

variable "env" {
  default = "staging"
}

variable "vpc_tag" {
  default = "vpc-staging"
}