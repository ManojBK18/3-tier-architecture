resource "aws_subnet" "tfer--subnet-0040a22e99866c0ba" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0dea0bee6eb53fc42_id}"
}

resource "aws_subnet" "tfer--subnet-00f5f3969e681f05c" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0dea0bee6eb53fc42_id}"
}

resource "aws_subnet" "tfer--subnet-0244d91612986b6c4" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.32.8.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"

  tags = {
    Name = "prviate2"
  }

  tags_all = {
    Name = "prviate2"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_subnet" "tfer--subnet-029ceac41f59c6587" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.32.3.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"

  tags = {
    Name = "Subnet-DB"
  }

  tags_all = {
    Name = "Subnet-DB"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_subnet" "tfer--subnet-045142dc209ca5656" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.32.10.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"

  tags = {
    Name = "Subnet-Backend"
  }

  tags_all = {
    Name = "Subnet-Backend"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_subnet" "tfer--subnet-06d95c7cb8bfbf7c8" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.32.1.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"

  tags = {
    Name = "Public-Subnet1"
  }

  tags_all = {
    Name = "Public-Subnet1"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_subnet" "tfer--subnet-0a3745759c15b96d4" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0dea0bee6eb53fc42_id}"
}

resource "aws_subnet" "tfer--subnet-0ad6b66902b1c27df" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.1.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"

  tags = {
    Name = "Subnet-Bastion"
  }

  tags_all = {
    Name = "Subnet-Bastion"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0c1fc7a742a040dee_id}"
}

resource "aws_subnet" "tfer--subnet-0f4f1bc3197896124" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.32.2.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"

  tags = {
    Name = "Subnet-Frontend"
  }

  tags_all = {
    Name = "Subnet-Frontend"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}
