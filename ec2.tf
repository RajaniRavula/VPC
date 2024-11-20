# EC2 Instances
resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0942ecd5d85baa812" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.web_sg.id] # Use security group IDs
  user_data     = file("userdata.sh")
  tags = {
    Name = "Web-Instance-${count.index + 1}"
  }
}