
# module "ec2_instance" {
#   source          = "../modules/ec2"
#   ami_id          = var.ami_id
#   instance_type   = var.instance_type
#   subnet_id       = module.vpc_network.sub_pub_id
#   security_groups = [ module.vpc_network.sg_ssh_allow ]
#   env             = var.env
#   team            = var.team
# }


# module "vpc_network" {
#   source          = "../modules/vpc"
#   cidr_block      = var.vpc_cidr_block
#   vpc_tag         = var.vpc_tag
#   public_subnet   = var.public_subnet_cidr_block
#   private_subnet  = var.private_subnet_cidr_block
#   env             = var.env
#  }

module "lambda_create"{
  source          = "../modules/lambda"
  env             = var.env
  function_name   = var.env #Put env value in starting of name
  runtime         = var.py_runtime
}

output "lambda_url"{
  value = module.lambda_create.lambda_function_invoke_url
}