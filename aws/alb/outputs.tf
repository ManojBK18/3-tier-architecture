output "aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-app-002F-ALB-Backend-002F-99c6c573e1869c09-002F-961c52bfe1245c7f_id" {
  value = "${aws_lb_listener.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-app-002F-ALB-Backend-002F-99c6c573e1869c09-002F-961c52bfe1245c7f.id}"
}

output "aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-net-002F-NLB-Backend-002F-453a36208ea2ecd1-002F-ca219d56bc4115b2_id" {
  value = "${aws_lb_listener.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-net-002F-NLB-Backend-002F-453a36208ea2ecd1-002F-ca219d56bc4115b2.id}"
}

output "aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-net-002F-NLB-Frontend-002F-9043e5df16603bc7-002F-20760f093fc40613_id" {
  value = "${aws_lb_listener.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-net-002F-NLB-Frontend-002F-9043e5df16603bc7-002F-20760f093fc40613.id}"
}

output "aws_lb_target_group_attachment_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-APP-Frontend-002F-dcce8b22c96ae47b-i-017b8cb78cbab98cb_id" {
  value = "${aws_lb_target_group_attachment.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-APP-Frontend-002F-dcce8b22c96ae47b-i-017b8cb78cbab98cb.id}"
}

output "aws_lb_target_group_attachment_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-APP-Frontend-002F-dcce8b22c96ae47b-i-09b2834a446f25c5f_id" {
  value = "${aws_lb_target_group_attachment.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-APP-Frontend-002F-dcce8b22c96ae47b-i-09b2834a446f25c5f.id}"
}

output "aws_lb_target_group_attachment_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-App-Back-002F-9a81a73ce92ea1f7-i-01fb317aecf8469e7_id" {
  value = "${aws_lb_target_group_attachment.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-App-Back-002F-9a81a73ce92ea1f7-i-01fb317aecf8469e7.id}"
}

output "aws_lb_target_group_attachment_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-App-Back-002F-9a81a73ce92ea1f7-i-0a02e1f6b18a300c0_id" {
  value = "${aws_lb_target_group_attachment.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-App-Back-002F-9a81a73ce92ea1f7-i-0a02e1f6b18a300c0.id}"
}

output "aws_lb_target_group_tfer--APP-Backend_id" {
  value = "${aws_lb_target_group.tfer--APP-Backend.id}"
}

output "aws_lb_target_group_tfer--APP-Frontend_id" {
  value = "${aws_lb_target_group.tfer--APP-Frontend.id}"
}

output "aws_lb_target_group_tfer--App-Back_id" {
  value = "${aws_lb_target_group.tfer--App-Back.id}"
}

output "aws_lb_target_group_tfer--back_id" {
  value = "${aws_lb_target_group.tfer--back.id}"
}

output "aws_lb_tfer--ALB-Backend_id" {
  value = "${aws_lb.tfer--ALB-Backend.id}"
}

output "aws_lb_tfer--NLB-Backend_id" {
  value = "${aws_lb.tfer--NLB-Backend.id}"
}

output "aws_lb_tfer--NLB-Frontend_id" {
  value = "${aws_lb.tfer--NLB-Frontend.id}"
}
