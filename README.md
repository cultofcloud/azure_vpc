# azure_vpc
Creation of Azure VPC Using Terraform Module

![alt text](https://github.com/cultofcloud/azure_vpc/blob/master/Images/Azure_VPC.png)

Below are the configuration considered for creating the VNET in Azure

- VNET CIDR: 10.0.0.0/16                # This provide 65535 IP Addresses

- Public SUBNET: 10.0.1.0/24            # This provide the subnet with 256 IP Addresses

- Private SUBNET: 10.0.2.0/24           # This again provides the subnet with 256 IP Addresses

- Network Security Group on Public Subnet: This allow traffic on port 8080, 443 and 22 from any source to the resources within public subnet

- Network Security Group on Private Subnet: This allow traffic only from within the Virtual Network and has Outbound internet access for patching the resources