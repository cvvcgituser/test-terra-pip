#Create EC2 Instance
resource "aws_instance" "webserver1" {
  ami                    = "${var.webserver1_ami_id}"
  instance_type          = "${var.webserver1_instance_type}"
  availability_zone      = "${var.webserver1_az}"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-1.id
  user_data              = file("install_apache.sh")

  tags = {
    Name = "${var.webserver1_nametag}"
  }

}

resource "aws_instance" "webserver2" {
  ami                    = "${var.webserver2_ami_id}"
  instance_type          = "${var.webserver2_instance_type}"
  availability_zone      = "${var.webserver2_az}"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-2.id
  user_data              = file("install_apache.sh")

  tags = {
    Name = "${var.webserver2_nametag}"
  }

}

