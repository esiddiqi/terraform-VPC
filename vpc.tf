resource "aws_vpc" "opsminds" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "opsmind_vpc"
  }
}





resource "aws_subnet" "opsminds-pubsub-1" {
  vpc_id     = aws_vpc.opsminds.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.ZONE1
  map_public_ip_on_launch = "true"


  tags = {
    Name = "opsminds-pubsub-1"
  }
}


resource "aws_subnet" "opsminds-pubsub-2" {
  vpc_id     = aws_vpc.opsminds.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.ZONE2
  map_public_ip_on_launch = "true"


  tags = {
    Name = "opsminds-pubsub-2"
  }
}


resource "aws_subnet" "opsminds-pubsub-3" {
  vpc_id     = aws_vpc.opsminds.id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.ZONE3
  map_public_ip_on_launch = "true"


  tags = {
    Name = "opsminds-pubsub-3"
  }
}




resource "aws_subnet" "opsminds-privsub-1" {
  vpc_id     = aws_vpc.opsminds.id
  cidr_block = "10.0.4.0/24"
  availability_zone = var.ZONE1
  map_public_ip_on_launch = "false"


  tags = {
    Name = "opsminds-privsub-1"
  }
}


resource "aws_subnet" "opsminds-privsub-2" {
  vpc_id     = aws_vpc.opsminds.id
  cidr_block = "10.0.5.0/24"
  availability_zone = var.ZONE2
  map_public_ip_on_launch = "false"


  tags = {
    Name = "opsminds-privsub-2"
  }
}



resource "aws_subnet" "opsminds-privsub-3" {
  vpc_id     = aws_vpc.opsminds.id
  cidr_block = "10.0.6.0/24"
  availability_zone = var.ZONE3
  map_public_ip_on_launch = "false"


  tags = {
    Name = "opsminds-privsub-3"
  }
}




resource "aws_internet_gateway" "opsminds-igw-1" {
  vpc_id = aws_vpc.opsminds.id

  tags = {
    Name = "opsminds-igw-1"
  }
}



resource "aws_route_table" "opsminds-pub-rt-1" {
  vpc_id = aws_vpc.opsminds.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.opsminds-igw-1.id
  }


  tags = {
    Name = "opsminds-pub-rt-1"
  }
}


resource "aws_route_table_association" "opsminds-pub-rt-1-opsminds-pubsub-1" {
  subnet_id      = aws_subnet.opsminds-pubsub-1.id
  route_table_id = aws_route_table.opsminds-pub-rt-1.id
}


resource "aws_route_table_association" "opsminds-pub-rt-1-opsminds-pubsub-2" {
  subnet_id      = aws_subnet.opsminds-pubsub-2.id
  route_table_id = aws_route_table.opsminds-pub-rt-1.id
}

resource "aws_route_table_association" "opsminds-pub-rt-1-opsminds-pubsub-3" {
  subnet_id      = aws_subnet.opsminds-pubsub-3.id
  route_table_id = aws_route_table.opsminds-pub-rt-1.id
}








