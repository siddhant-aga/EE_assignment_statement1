# Defining Jenkins instance inside the public subnet
resource "aws_instance" "public-instance" {
   ami  = var.ami
   instance_type = "t2.micro"
   key_name = aws_key_pair.mykeypair.key_name
   subnet_id = aws_subnet.public-subnet.id
   vpc_security_group_ids = [aws_security_group.public-sg.id]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = file("public_instance_userdata.sh")

  tags = {
    Name = "Jenkins CICD Public Instance"
  }
}

# Defining Artifact runner instance inside the private subnet
resource "aws_instance" "private-instance" {
   ami  = var.ami
   instance_type = "t2.micro"
   key_name = aws_key_pair.mykeypair.key_name
   subnet_id = aws_subnet.private-subnet.id
   vpc_security_group_ids = [aws_security_group.private-sg.id]
   source_dest_check = false
   user_data = file("private_instance_userdata.sh")

  tags = {
    Name = "Artifact Runner Private Instance"
  }
}
