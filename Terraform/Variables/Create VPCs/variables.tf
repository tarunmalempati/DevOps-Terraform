variable "vpcs" {
 type = list
 default = [
 {
   cidr_block = "10.1.0.0/16"
   tenancy = "default"
   name = "demo-vpc-1"
 },
 {
   cidr_block = "10.1.0.0/16"
   tenancy = "default"
   name = "demp-vpc-2"
 }
]
}
