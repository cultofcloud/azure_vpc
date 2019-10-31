# Creating VNet for different environment using Modules

module "azure_vnet"{
  source = "..\/..\/..\/modules\/vnet"
  resource_group_name = "vnet_resourceGroup"
  vnet_name = "Dev_VNet"
  address_space = "10.0.0.0/16"
  public_subnet = "public_subnet"
  public_address_prefix = "10.0.1.0/24"
  private_address_prefix = "10.0.2.0/24"
  private_subnet = "private_subnet"
  tags = "Dev"
}
