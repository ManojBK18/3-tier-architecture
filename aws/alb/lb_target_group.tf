resource "aws_lb_target_group" "tfer--APP-Backend" {
  connection_termination = "false"
  deregistration_delay   = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "30"
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = "10"
    unhealthy_threshold = "2"
  }

  ip_address_type                   = "ipv4"
  load_balancing_cross_zone_enabled = "use_load_balancer_configuration"
  name                              = "APP-Backend"
  port                              = "80"
  preserve_client_ip                = "true"
  protocol                          = "TCP"
  proxy_protocol_v2                 = "false"
  region                            = "ap-south-1"

  stickiness {
    cookie_duration = "0"
    enabled         = "false"
    type            = "source_ip"
  }

  target_control_port = "0"

  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }

    unhealthy_state_routing {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
  }

  target_health_state {
    enable_unhealthy_connection_termination = "true"
    unhealthy_draining_interval             = "0"
  }

  target_type = "instance"
  vpc_id      = "vpc-040f940eeea978cf5"
}

resource "aws_lb_target_group" "tfer--APP-Frontend" {
  connection_termination = "false"
  deregistration_delay   = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "30"
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = "10"
    unhealthy_threshold = "2"
  }

  ip_address_type                   = "ipv4"
  load_balancing_cross_zone_enabled = "use_load_balancer_configuration"
  name                              = "APP-Frontend"
  port                              = "80"
  preserve_client_ip                = "true"
  protocol                          = "TCP"
  proxy_protocol_v2                 = "false"
  region                            = "ap-south-1"

  stickiness {
    cookie_duration = "0"
    enabled         = "false"
    type            = "source_ip"
  }

  target_control_port = "0"

  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }

    unhealthy_state_routing {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
  }

  target_health_state {
    enable_unhealthy_connection_termination = "true"
    unhealthy_draining_interval             = "0"
  }

  target_type = "instance"
  vpc_id      = "vpc-040f940eeea978cf5"
}

resource "aws_lb_target_group" "tfer--App-Back" {
  connection_termination = "false"
  deregistration_delay   = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "30"
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = "6"
    unhealthy_threshold = "2"
  }

  ip_address_type                   = "ipv4"
  load_balancing_cross_zone_enabled = "use_load_balancer_configuration"
  name                              = "App-Back"
  port                              = "8080"
  preserve_client_ip                = "true"
  protocol                          = "TCP"
  proxy_protocol_v2                 = "false"
  region                            = "ap-south-1"

  stickiness {
    cookie_duration = "0"
    enabled         = "false"
    type            = "source_ip"
  }

  target_control_port = "0"

  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }

    unhealthy_state_routing {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
  }

  target_health_state {
    enable_unhealthy_connection_termination = "true"
    unhealthy_draining_interval             = "0"
  }

  target_type = "instance"
  vpc_id      = "vpc-040f940eeea978cf5"
}

resource "aws_lb_target_group" "tfer--back" {
  deregistration_delay = "300"

  health_check {
    enabled             = "true"
    healthy_threshold   = "5"
    interval            = "30"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "2"
  }

  ip_address_type                   = "ipv4"
  load_balancing_algorithm_type     = "round_robin"
  load_balancing_anomaly_mitigation = "off"
  load_balancing_cross_zone_enabled = "use_load_balancer_configuration"
  name                              = "back"
  port                              = "80"
  protocol                          = "HTTP"
  protocol_version                  = "HTTP1"
  region                            = "ap-south-1"
  slow_start                        = "0"

  stickiness {
    cookie_duration = "86400"
    enabled         = "false"
    type            = "lb_cookie"
  }

  target_control_port = "0"

  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }

    unhealthy_state_routing {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
  }

  target_type = "instance"
  vpc_id      = "vpc-040f940eeea978cf5"
}
