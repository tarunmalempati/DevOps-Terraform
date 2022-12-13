variable "region" {
  type = string
  default = "ap-southeast-1"
}

variable "created_by" {
  type = string
  default = "phani"
}

variable "cidrblock" {
  type = string 
  default="192.168.0.0/16"
}

variable "tenancy" {
  type = string
  default = "default"
}

variable "name" {
  type = string
  default = "demo-vpc"
}

variable "ps_cidr" {
  type = string
  default="192.168.1.0/24"
}

variable "map_public_ip_on_launch" {
  type = string
  default = "true"
}

variable "enable_resource_name_dns_a_record_on_launch" {
  type = string
  default = "true"
}

variable "ps_name" {
  type = string
  default = "public-subnet-1a"
}

variable "igw_name" {
  type = string
  default = "demo_igw"
}

variable "prt_name" {
  type = string
  default = "public-rt"
}