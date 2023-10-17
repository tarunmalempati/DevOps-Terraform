variable "public_subnets" {
   type = list
   default = [
    {
      cidr_block = "10.1.1.0/24"
      az = "ap-south-1a"
      public_ip = "true"
      name = "demo-public-1a"
    },
    {
      cidr_block = "10.1.2.0/24"
      az = "ap-south-1b"
      public_ip = "true"
      name = "demo-public-1b"
    }
  ]
}

variable "private_subnets" {
   type = list
   default = [
    {
      cidr_block = "10.1.3.0/24"
      az = "ap-south-1a"
      name = "demo-private-1a"
    },
    {
      cidr_block = "10.1.4.0/24"
      az = "ap-south-1b"
      name = "demo-private-1b"
    }
  ]
}

variable "public_rta" {
   type = list
   default = [
    {
      subnet_id = "aws_subnet.demo-public-1a.id"
      route_teble_id = "aws_route_table.demo-public-rt.id"
    },
    {
      subnet_id = "aws_subnet.demo-public-1b.id"
      route_teble_id = "aws_route_table.demo-public-rt.id"
     }
   ]
}

variable "private_rts"{
   type = list
   default = [ 
    {variable "public_nats" {
   type = list
   default = [ 
    {
     allocation_id = "aws_eip.eip-1.id"
     subnet_id = "aws_subnet.demo-public-1a.id"
     name = "demo-public-1a-nat"
    },
    {
     allocation_id = "aws_eip.eip-2.id"
     subnet_id = "aws_subnet.demo-public-1b.id"
     name = "demo-public-1b-nat"
    }
  ]
}
      cidr_block = "0.0.0.0/0"
      gateway_id = "aws_nat_gateway.demo-public-1a-nat.id"
      name = "demo-private-1a-rt"
    },
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = "aws_nat_gateway.demo-public-1b-nat.id"
      name = "demo-private-1b-rt"
    }
 ]
}

