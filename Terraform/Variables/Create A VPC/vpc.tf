resource "aws_vpc" "main" {
  cidr_block       = var.cidrblock
  instance_tenancy = var.tenancy
  tags = {
    Name = var.name
    terraformed="true"
    created_by= var.created_by
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
    terraformed="true"
    created_by= var.created_by
  }
}

resource "aws_subnet" "public-subnet-1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.ps_cidr
  availability_zone = "ap-southeast-1a"
  map_public_ip_on_launch = var.map_public_ip_on_launch
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch
  tags = {
    Name = var.ps_name
    created_by= var.created_by
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "ap-southeast-1b"
  map_public_ip_on_launch = var.map_public_ip_on_launch
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch
  tags = {
    Name = var.ps_name
    created_by= var.created_by
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.prt_name
    created_by= var.created_by
  }
}

resource "aws_route_table_association" "psubnets_association-1a" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "psubnets_association-1b" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.public_rt.id
}