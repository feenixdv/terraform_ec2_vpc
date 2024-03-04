variable "ami_id" {
  default = "ami-0c7217cdde3178888" # Replace with your AMI ID
}

variable "instance_type" {
  default = "t2.micro"
}

variable "team" {
  default = "DevOps"
}

variable "env" {
  default = "default"
}

variable "subnet_id" {
  default = "Default"
}

variable "security_groups" {
  default = "Default"
}