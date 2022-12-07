# Create a VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  tags = {
    Name = "${var.vpc_name}"
  }
}

# Create Web Public Subnet
resource "aws_subnet" "web-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "${var.websubnet1_cidr_block}"
  availability_zone       = "${var.websubnet1_az}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.websubnet1_nametag}"
  }
}

resource "aws_subnet" "web-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "${var.websubnet2_cidr_block}"
  availability_zone       = "${var.websubnet2_az}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.websubnet2_nametag}"
  }
}

# Create Application Private Subnet
resource "aws_subnet" "application-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "${var.appsubnet1_cidr_block}"
  availability_zone       = "${var.appsubnet1_az}"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.appsubnet1_nametag}"
  }
}

resource "aws_subnet" "application-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "${var.appsubnet2_cidr_block}"
  availability_zone       = "${var.appsubnet2_az}"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.appsubnet2_nametag}"
  }
}

# Create Database Private Subnet
resource "aws_subnet" "database-subnet-1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "${var.dbsubnet1_cidr_block}"
  availability_zone = "${var.dbsubnet1_az}"

  tags = {
    Name = "${var.dbsubnet1_nametag}"
  }
}

resource "aws_subnet" "database-subnet-2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "${var.dbsubnet2_cidr_block}"
  availability_zone = "${var.dbsubnet2_az}"

  tags = {
    Name = "${var.dbsubnet2_nametag}"
  }
}
resource "aws_subnet" "database-subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Database"
  }
}
# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "${var.igw_nametag}"
  }
}

# Create Web layber route table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.my-vpc.id


  route {
    cidr_block = "${var.route_cidr_block}"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.webrt_nametag}"
  }
}

# Create Web Subnet association with Web route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.web-subnet-1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.web-subnet-2.id
  route_table_id = aws_route_table.web-rt.id
}
