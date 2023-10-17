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

resource "aws_subnet" "demo-public-subnets" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.demo.id
  cidr_block = lookup(var.public_subnets[count.index],"cidr_block")
  availability_zone = lookup(var.public_subnets[count.index],"az")
  map_public_ip_on_launch = lookup(var.public_subnets[count.index],"public_ip")
  tags = {
    Name = lookup(var.public_subnets[count.index],"name")
  }
}

resource "aws_subnet" "demo-private-subnets" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.demo.id
  cidr_block = lookup(var.private_subnets[count.index],"cidr_block")
  availability_zone = lookup(var.private_subnets[count.index],"az")
  tags = {
    Name = lookup(var.private_subnets[count.index],"name")
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

resource "aws_route_table" "demo-private-rts" {
  count = length(var.private_rts)
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = lookup(var.private_rts[count.index],"cidr_block")
    gateway_id = lookup(var.private_rts[count.index],"gateway_id")
}
  tags = {
    Name = lookup(var.private_rts[count.index],"name")
  }
}

resource "aws_route_table_association" "demo-public-rta" {
  count = length(var.public_rta)
  subnet_id      = lookup(var.public_rta[count.index],"subnet_id")
  route_table_id = lookup(var.public_rta[count.index],"route_table_id")
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

resource "aws_nat_gateway" "demo-public-nats" {
  count = length(var.public_nats)
  allocation_id = lookup(var.public_nats[count.index],"allocation_id")
  subnet_id     = lookup(var.public_nats[count.index],"subnet_id")

  tags = {
    Name = lookup(var.public_nats[count.index],"name")
}
  depends_on = [aws_internet_gateway.igw]
}
              
