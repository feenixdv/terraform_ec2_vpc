variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_tag" {
  default = "default"
}

variable "env" {
  default = "default"
}

variable "public_subnet" {
  default = "10.0.1.0/24"
}

variable "private_subnet" {
  default = "10.0.2.0/24"
}