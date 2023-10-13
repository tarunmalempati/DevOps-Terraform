resource "aws_vpc" "demo" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "demo-igw"
  }
}

resource "aws_subnet" "demo-public-1a" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "demo-public-1a"
  }
}

  resource "aws_subnet" "demo-public-1b" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "demo-public-1b"
  }
}

resource "aws_subnet" "demo-private-1a" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.1.3.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "demo-private-1a"
  }
}

resource "aws_subnet" "demo-private-1b" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.1.4.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "demo-private-1b"
  }
}

resource "aws_route_table" "demo-public-rt" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}
  tags = {
    Name = "demo-public-rt"
  }
}

resource "aws_route_table" "demo-private-1a-rt" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.demo-public-1a-nat.id
}
  tags = {
    Name = "demo-private-1a-rt"
  }
}

resource "aws_route_table" "demo-private-1b-rt" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.demo-public-1b-nat.id
}
  tags = {
    Name = "demo-private-1b-rt"
  }
}

resource "aws_route_table_association" "demo-public-1a" {
  subnet_id      = aws_subnet.demo-public-1a.id
  route_table_id = aws_route_table.demo-public-rt.id
}

resource "aws_route_table_association" "demo-public-1b" {
  subnet_id      = aws_subnet.demo-public-1b.id
  route_table_id = aws_route_table.demo-public-rt.id
}

resource "aws_route_table_association" "demo-private-1a" {
  subnet_id      = aws_subnet.demo-private-1a.id
  route_table_id = aws_route_table.demo-private-1a-rt.id
}

resource "aws_route_table_association" "demo-private-1b" {
  subnet_id      = aws_subnet.demo-private-1b.id
  route_table_id = aws_route_table.demo-private-1b-rt.id
}

resource "aws_eip" "eip-1" {
  domain   = "vpc"
}

resource "aws_eip" "eip-2" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "demo-public-1a-nat" {
  allocation_id = aws_eip.eip-1.id
  subnet_id     = aws_subnet.demo-public-1a.id

  tags = {
    Name = "demo-public-1a-nat"
}
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "demo-public-1b-nat" {
  allocation_id = aws_eip.eip-2.id
  subnet_id     = aws_subnet.demo-public-1b.id

  tags = {
    Name = "demo-public-1b-nat"
}
  depends_on = [aws_internet_gateway.igw]
}
