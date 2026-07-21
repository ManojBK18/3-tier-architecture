resource "aws_lb" "tfer--ALB-Backend" {
  client_keep_alive = "3600"

  connection_logs {
    enabled = "false"
  }

  desync_mitigation_mode                      = "defensive"
  drop_invalid_header_fields                  = "false"
  enable_cross_zone_load_balancing            = "true"
  enable_deletion_protection                  = "false"
  enable_http2                                = "true"
  enable_tls_version_and_cipher_suite_headers = "false"
  enable_waf_fail_open                        = "false"
  enable_xff_client_port                      = "false"
  enable_zonal_shift                          = "false"

  health_check_logs {
    enabled = "false"
  }

  idle_timeout         = "60"
  internal             = "true"
  ip_address_type      = "ipv4"
  load_balancer_type   = "application"
  name                 = "ALB-Backend"
  preserve_host_header = "false"
  region               = "ap-south-1"
  security_groups      = ["sg-0c79d7d7da344e618"]

  subnet_mapping {
    subnet_id = "subnet-0244d91612986b6c4"
  }

  subnet_mapping {
    subnet_id = "subnet-045142dc209ca5656"
  }

  subnets                    = ["subnet-0244d91612986b6c4", "subnet-045142dc209ca5656"]
  xff_header_processing_mode = "append"
}

resource "aws_lb" "tfer--NLB-Backend" {
  dns_record_client_routing_policy       = "any_availability_zone"
  enable_cross_zone_load_balancing       = "false"
  enable_deletion_protection             = "false"
  enable_zonal_shift                     = "false"
  internal                               = "true"
  ip_address_type                        = "ipv4"
  load_balancer_type                     = "network"
  name                                   = "NLB-Backend"
  region                                 = "ap-south-1"
  secondary_ips_auto_assigned_per_subnet = "0"
  security_groups                        = ["sg-0c79d7d7da344e618"]

  subnet_mapping {
    subnet_id = "subnet-045142dc209ca5656"
  }

  subnets = ["subnet-045142dc209ca5656"]
}

resource "aws_lb" "tfer--NLB-Frontend" {
  dns_record_client_routing_policy       = "any_availability_zone"
  enable_cross_zone_load_balancing       = "false"
  enable_deletion_protection             = "false"
  enable_zonal_shift                     = "false"
  internal                               = "false"
  ip_address_type                        = "ipv4"
  load_balancer_type                     = "network"
  name                                   = "NLB-Frontend"
  region                                 = "ap-south-1"
  secondary_ips_auto_assigned_per_subnet = "0"
  security_groups                        = ["sg-04eaa21be3eec71b6"]

  subnet_mapping {
    subnet_id = "subnet-06d95c7cb8bfbf7c8"
  }
}
