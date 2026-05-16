resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-app-002F-ALB-Backend-002F-99c6c573e1869c09-002F-961c52bfe1245c7f" {
  default_action {
    forward {
      stickiness {
        duration = "3600"
        enabled  = "false"
      }

      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/back/529e9060cf70ddde"
        weight = "1"
      }
    }

    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/back/529e9060cf70ddde"
    type             = "forward"
  }

  load_balancer_arn                    = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--ALB-Backend_id}"
  port                                 = "80"
  protocol                             = "HTTP"
  region                               = "ap-south-1"
  routing_http_response_server_enabled = "true"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-net-002F-NLB-Backend-002F-453a36208ea2ecd1-002F-ca219d56bc4115b2" {
  default_action {
    forward {
      stickiness {
        duration = "0"
        enabled  = "false"
      }

      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/App-Back/9a81a73ce92ea1f7"
        weight = "1"
      }
    }

    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/App-Back/9a81a73ce92ea1f7"
    type             = "forward"
  }

  load_balancer_arn        = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--NLB-Backend_id}"
  port                     = "80"
  protocol                 = "TCP"
  region                   = "ap-south-1"
  tcp_idle_timeout_seconds = "350"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-ap-south-1-003A-911167914217-003A-listener-002F-net-002F-NLB-Frontend-002F-9043e5df16603bc7-002F-20760f093fc40613" {
  default_action {
    forward {
      stickiness {
        duration = "0"
        enabled  = "false"
      }

      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/APP-Frontend/dcce8b22c96ae47b"
        weight = "1"
      }
    }

    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:911167914217:targetgroup/APP-Frontend/dcce8b22c96ae47b"
    type             = "forward"
  }

  load_balancer_arn        = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--NLB-Frontend_id}"
  port                     = "80"
  protocol                 = "TCP"
  region                   = "ap-south-1"
  tcp_idle_timeout_seconds = "350"
}
