resource "aws_ec2_transit_gateway" "tfer--tgw-0b232d02ab2af1a16" {
  amazon_side_asn                    = "64512"
  auto_accept_shared_attachments     = "enable"
  default_route_table_association    = "enable"
  default_route_table_propagation    = "enable"
  dns_support                        = "enable"
  encryption_support                 = "disable"
  multicast_support                  = "disable"
  region                             = "ap-south-1"
  security_group_referencing_support = "disable"

  tags = {
    Name = "TG-APP"
  }

  tags_all = {
    Name = "TG-APP"
  }

  vpn_ecmp_support = "enable"
}
