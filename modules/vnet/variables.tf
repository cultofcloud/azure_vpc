variable "resource_group_name" {
  description = "Resouce Group that will be created"
  type = string
}
variable "vnet_name" {}

variable "location" {
  default = "West US"
}

variable "address_space"{}

variable "public_subnet" {}

variable "private_subnet" {}
variable "public_address_prefix" {}
variable "private_address_prefix" {}
variable "tags" {}