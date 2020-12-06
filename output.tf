output "jenkins-ip" {
  value = aws_instance.public-instance.public_ip
}