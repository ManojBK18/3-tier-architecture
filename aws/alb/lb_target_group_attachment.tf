resource "aws_lb_target_group_attachment" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-APP-Frontend-002F-dcce8b22c96ae47b-i-017b8cb78cbab98cb" {
  region           = "ap-south-1"
  target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/APP-Frontend/dcce8b22c96ae47b"
  target_id        = "i-017b8cb78cbab98cb"
}

resource "aws_lb_target_group_attachment" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-APP-Frontend-002F-dcce8b22c96ae47b-i-09b2834a446f25c5f" {
  region           = "ap-south-1"
  target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/APP-Frontend/dcce8b22c96ae47b"
  target_id        = "i-09b2834a446f25c5f"
}

resource "aws_lb_target_group_attachment" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-App-Back-002F-9a81a73ce92ea1f7-i-01fb317aecf8469e7" {
  region           = "ap-south-1"
  target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/App-Back/9a81a73ce92ea1f7"
  target_id        = "i-01fb317aecf8469e7"
}

resource "aws_lb_target_group_attachment" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-targetgroup-002F-App-Back-002F-9a81a73ce92ea1f7-i-0a02e1f6b18a300c0" {
  region           = "ap-south-1"
  target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/App-Back/9a81a73ce92ea1f7"
  target_id        = "i-0a02e1f6b18a300c0"
}
