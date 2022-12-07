#Create EC2 Instance
resource "aws_instance" "webserver1" {
  ami                    = "${var.webserver1_ami_id}"
  instance_type          = "${var.webserver1_instance_type}"
  availability_zone      = "${var.webserver1_az}"
  vpc_security_group_ids = [var.webserver1_sg]
  subnet_id              = var.webserver1_subnet_1
  user_data              = file("install_apache.sh")

  tags = {
    Name = "${var.webserver1_nametag}"
  }

}

resource "aws_instance" "webserver2" {
  ami                    = "${var.webserver2_ami_id}"
  instance_type          = "${var.webserver2_instance_type}"
  availability_zone      = "${var.webserver2_az}"
  vpc_security_group_ids = [var.webserver1_sg]
  subnet_id              = var.webserver2_subnet_2
  user_data              = file("install_apache.sh")

  tags = {
    Name = "${var.webserver2_nametag}"
  }

}

