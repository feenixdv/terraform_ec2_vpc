
resource "aws_instance" "webserver" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id     =  var.subnet_id
  associate_public_ip_address = true
  key_name = "feenixdv" 
  security_groups = var.security_groups
 
  tags = {
    Name = "webserver-staging"
    team = var.team
    env  = var.env
  }
}
