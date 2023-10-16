resource "aws_vpc" "demo" {
  count = length(var.vpcs)
  cidr_block       = lookup(var.vpcs[count.index],"cidr_block")
  instance_tenancy = lookup(var.vpcs[count.index],"tenancy")
  tags = {
    Name = lookup(var.vpcs[count.index],"name")
  }
}
