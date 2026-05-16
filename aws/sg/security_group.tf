resource "aws_security_group" "tfer--APP-Backend_sg-0a3f5866ca01859b3" {
  description = "launch-wizard-4 created 2026-05-10T09:51:27.660Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["172.32.0.0/16"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  ingress {
    cidr_blocks = ["172.32.0.0/16"]
    from_port   = "8080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8080"
  }

  ingress {
    from_port       = "3306"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--DB_sg-042b85cdaa391bf0a_id}"]
    self            = "false"
    to_port         = "3306"
  }

  name   = "APP-Backend"
  region = "ap-south-1"
  vpc_id = "vpc-040f940eeea978cf5"
}

resource "aws_security_group" "tfer--APP-Frontend_sg-0592ea2263a80be04" {
  description = "launch-wizard-4 created 2026-05-10T09:44:21.351Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name   = "APP-Frontend"
  region = "ap-south-1"
  vpc_id = "vpc-040f940eeea978cf5"
}

resource "aws_security_group" "tfer--DB_sg-042b85cdaa391bf0a" {
  description = "launch-wizard-4 created 2026-05-12T06:38:11.589Z"
  name        = "DB"
  region      = "ap-south-1"
  vpc_id      = "vpc-040f940eeea978cf5"
}

resource "aws_security_group" "tfer--NLB-Backend_sg-0c79d7d7da344e618" {
  description = "NLB-Backend"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port       = "80"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--APP-Frontend_sg-0592ea2263a80be04_id}"]
    self            = "false"
    to_port         = "80"
  }

  name   = "NLB-Backend"
  region = "ap-south-1"
  vpc_id = "vpc-040f940eeea978cf5"
}

resource "aws_security_group" "tfer--NLB-Frontend_sg-04eaa21be3eec71b6" {
  description = "NLB-Frontend"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name   = "NLB-Frontend"
  region = "ap-south-1"
  vpc_id = "vpc-040f940eeea978cf5"
}

resource "aws_security_group" "tfer--default_sg-02b7d5bb9188c2f4b" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  region = "ap-south-1"
  vpc_id = "vpc-0c1fc7a742a040dee"
}

resource "aws_security_group" "tfer--default_sg-0a285b9cfd251165b" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  region = "ap-south-1"
  vpc_id = "vpc-0dea0bee6eb53fc42"
}

resource "aws_security_group" "tfer--default_sg-0ee1ff53978e8f8bc" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  region = "ap-south-1"
  vpc_id = "vpc-040f940eeea978cf5"
}

resource "aws_security_group" "tfer--launch-wizard-1_sg-0558f577b6970253b" {
  description = "launch-wizard-1 created 2026-05-04T12:10:57.363Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "8080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8080"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "9090"
    protocol    = "tcp"
    self        = "false"
    to_port     = "9090"
  }

  name   = "launch-wizard-1"
  region = "ap-south-1"
  vpc_id = "vpc-0dea0bee6eb53fc42"
}

resource "aws_security_group" "tfer--launch-wizard-2_sg-0505ef4d93d3b99c4" {
  description = "launch-wizard-2 created 2026-05-08T06:20:42.136Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "launch-wizard-2"
  region = "ap-south-1"
  vpc_id = "vpc-0dea0bee6eb53fc42"
}

resource "aws_security_group" "tfer--launch-wizard-3_sg-01e31f7b4dc5c1c70" {
  description = "launch-wizard-3 created 2026-05-10T09:42:38.294Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "launch-wizard-3"
  region = "ap-south-1"
  vpc_id = "vpc-0c1fc7a742a040dee"
}
