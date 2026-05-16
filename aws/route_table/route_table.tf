resource "aws_route_table" "tfer--rtb-01e8b3eb586294a46" {
  region = "ap-south-1"
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0c1fc7a742a040dee_id}"
}

resource "aws_route_table" "tfer--rtb-01edd0d60730c5a84" {
  region = "ap-south-1"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0b78226c096f831b0"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_route_table" "tfer--rtb-057d05b7dcba5f953" {
  region = "ap-south-1"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0b78226c096f831b0"
  }

  tags = {
    Name = "RT-Public"
  }

  tags_all = {
    Name = "RT-Public"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_route_table" "tfer--rtb-06ce98a21de384fea" {
  region = "ap-south-1"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-1446a39aa145b68c8"
  }

  route {
    cidr_block         = "10.0.0.0/16"
    transit_gateway_id = "tgw-0b232d02ab2af1a16"
  }

  tags = {
    Name = "RT-NGW"
  }

  tags_all = {
    Name = "RT-NGW"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_route_table" "tfer--rtb-074719bdc524322ec" {
  region = "ap-south-1"
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_route_table" "tfer--rtb-098caedbcb88f18fe" {
  region = "ap-south-1"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-1446a39aa145b68c8"
  }

  route {
    cidr_block         = "10.0.0.0/16"
    transit_gateway_id = "tgw-0b232d02ab2af1a16"
  }

  tags = {
    Name = "RT-DB"
  }

  tags_all = {
    Name = "RT-DB"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-040f940eeea978cf5_id}"
}

resource "aws_route_table" "tfer--rtb-0d56a9549268d5dc6" {
  region = "ap-south-1"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-016df6863f9a88eba"
  }

  route {
    cidr_block         = "172.32.0.0/16"
    transit_gateway_id = "tgw-0b232d02ab2af1a16"
  }

  tags = {
    Name = "RT-Bastion"
  }

  tags_all = {
    Name = "RT-Bastion"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0c1fc7a742a040dee_id}"
}

resource "aws_route_table" "tfer--rtb-0e8d26614e74151ff" {
  region = "ap-south-1"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0b521a0fb544c7de2"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0dea0bee6eb53fc42_id}"
}
