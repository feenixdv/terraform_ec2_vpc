output "sub_pub_id" {
  value = aws_subnet.public.id 
}

output "sg_ssh_allow"{
  value = aws_security_group.all_ssh.id
}