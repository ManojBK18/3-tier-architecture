resource "aws_route_table_association" "tfer--nat-1446a39aa145b68c8" {
  gateway_id     = "nat-1446a39aa145b68c8"
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-01edd0d60730c5a84_id}"
}

resource "aws_route_table_association" "tfer--subnet-029ceac41f59c6587" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-098caedbcb88f18fe_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-029ceac41f59c6587_id}"
}

resource "aws_route_table_association" "tfer--subnet-045142dc209ca5656" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-06ce98a21de384fea_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-045142dc209ca5656_id}"
}

resource "aws_route_table_association" "tfer--subnet-06d95c7cb8bfbf7c8" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-057d05b7dcba5f953_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-06d95c7cb8bfbf7c8_id}"
}

resource "aws_route_table_association" "tfer--subnet-0ad6b66902b1c27df" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-0d56a9549268d5dc6_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0ad6b66902b1c27df_id}"
}

resource "aws_route_table_association" "tfer--subnet-0f4f1bc3197896124" {
  region         = "ap-south-1"
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-06ce98a21de384fea_id}"
  subnet_id      = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0f4f1bc3197896124_id}"
}
