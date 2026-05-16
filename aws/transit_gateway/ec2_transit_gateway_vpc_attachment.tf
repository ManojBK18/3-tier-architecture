resource "aws_ec2_transit_gateway_vpc_attachment" "tfer--tgw-attach-0c51606dce9097a26" {
  appliance_mode_support                          = "disable"
  dns_support                                     = "enable"
  ipv6_support                                    = "disable"
  region                                          = "ap-south-1"
  security_group_referencing_support              = "enable"
  subnet_ids                                      = ["subnet-06d95c7cb8bfbf7c8"]
  transit_gateway_default_route_table_association = "true"
  transit_gateway_default_route_table_propagation = "true"
  transit_gateway_id                              = "${data.terraform_remote_state.transit_gateway.outputs.aws_ec2_transit_gateway_tfer--tgw-0b232d02ab2af1a16_id}"
  vpc_id                                          = "vpc-040f940eeea978cf5"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tfer--tgw-attach-0c5e62ae5ff979fad" {
  appliance_mode_support                          = "disable"
  dns_support                                     = "enable"
  ipv6_support                                    = "disable"
  region                                          = "ap-south-1"
  security_group_referencing_support              = "enable"
  subnet_ids                                      = ["subnet-0ad6b66902b1c27df"]
  transit_gateway_default_route_table_association = "true"
  transit_gateway_default_route_table_propagation = "true"
  transit_gateway_id                              = "${data.terraform_remote_state.transit_gateway.outputs.aws_ec2_transit_gateway_tfer--tgw-0b232d02ab2af1a16_id}"
  vpc_id                                          = "vpc-0c1fc7a742a040dee"
}
