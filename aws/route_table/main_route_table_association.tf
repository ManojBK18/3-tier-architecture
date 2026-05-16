resource "aws_main_route_table_association" "tfer--vpc-040f940eeea978cf5" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-074719bdc524322ec_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_main_route_table_association" "tfer--vpc-0c1fc7a742a040dee" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-01e8b3eb586294a46_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0c1fc7a742a040dee_id}"
}

resource "aws_main_route_table_association" "tfer--vpc-0dea0bee6eb53fc42" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0e8d26614e74151ff_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0dea0bee6eb53fc42_id}"
}
