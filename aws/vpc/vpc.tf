resource "aws_vpc" "tfer--vpc-040f940eeea978cf5" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.32.0.0/16"
  enable_dns_hostnames                 = "false"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"
  region                               = "ap-south-1"

  tags = {
    Name = "VPC-APP"
  }

  tags_all = {
    Name = "VPC-APP"
  }
}

resource "aws_vpc" "tfer--vpc-0c1fc7a742a040dee" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = "false"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"
  region                               = "ap-south-1"

  tags = {
    Name = "VPC-1"
  }

  tags_all = {
    Name = "VPC-1"
  }
}

resource "aws_vpc" "tfer--vpc-0dea0bee6eb53fc42" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"
  region                               = "ap-south-1"
}
