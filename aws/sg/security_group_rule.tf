resource "aws_security_group_rule" "tfer--sg-042b85cdaa391bf0a_egress_-1_-1_-1_0-002E-0-002E-0-002E-0-002F-0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "0"
  protocol          = "-1"
  region            = "ap-south-1"
  security_group_id = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--DB_sg-042b85cdaa391bf0a_id}"
  to_port           = "0"
  type              = "egress"
}

resource "aws_security_group_rule" "tfer--sg-042b85cdaa391bf0a_ingress_tcp_22_22_10-002E-0-002E-0-002E-0-002F-16" {
  cidr_blocks       = ["10.0.0.0/16"]
  from_port         = "22"
  protocol          = "tcp"
  region            = "ap-south-1"
  security_group_id = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--DB_sg-042b85cdaa391bf0a_id}"
  to_port           = "22"
  type              = "ingress"
}

resource "aws_security_group_rule" "tfer--sg-042b85cdaa391bf0a_ingress_tcp_3306_3306_sg-0a3f5866ca01859b3" {
  from_port                = "3306"
  protocol                 = "tcp"
  region                   = "ap-south-1"
  security_group_id        = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--DB_sg-042b85cdaa391bf0a_id}"
  source_security_group_id = "${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--APP-Backend_sg-0a3f5866ca01859b3_id}"
  to_port                  = "3306"
  type                     = "ingress"
}
