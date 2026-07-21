resource "aws_instance" "tfer--i-017b8cb78cbab98cb_APP-Frontend2" {
  ami                         = "ami-07a00cf47dbbc844c"
  associate_public_ip_address = "false"
  availability_zone           = "ap-south-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"
  key_name                             = "APP"

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-0348b1c55c9b0f801"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.32.2.211"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0f4f1bc3197896124_id}"

  tags = {
    Name = "APP-Frontend2"
  }

  tags_all = {
    Name = "APP-Frontend2"
  }

  tenancy                = "default"
  user_data_base64       = "IyEvYmluL2Jhc2gKYXB0LWdldCB1cGRhdGUgLXkKYXB0LWdldCBpbnN0YWxsIC15IG5naW54CnN5c3RlbWN0bCBzdGFydCBuZ2lueApzeXN0ZW1jdGwgZW5hYmxlIG5naW54CmVjaG8gIjxoMT5OZ2lueCBpcyBydW5uaW5nIG9uICQoaG9zdG5hbWUpPC9oMT4iID4gL3Zhci93d3cvaHRtbC9pbmRleC5odG1sCg=="
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--APP-Frontend_sg-0592ea2263a80be04_id}"]
}

resource "aws_instance" "tfer--i-01fb317aecf8469e7_APP-Backend" {
  ami                         = "ami-07a00cf47dbbc844c"
  associate_public_ip_address = "false"
  availability_zone           = "ap-south-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"
  key_name                             = "APP"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-08981d81cec8e1793"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.32.10.35"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-045142dc209ca5656_id}"

  tags = {
    Name = "APP-Backend"
  }

  tags_all = {
    Name = "APP-Backend"
  }

  tenancy                = "default"
  user_data_base64       = "YXB0IHVwZGF0ZSAteQphcHQgaW5zdGFsbCBvcGVuamRrLTIxLWpkayAteQ=="
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--APP-Backend_sg-0a3f5866ca01859b3_id}"]
}

resource "aws_instance" "tfer--i-03fb5b28dc457dfe0_DB" {
  ami                         = "ami-07a00cf47dbbc844c"
  associate_public_ip_address = "false"
  availability_zone           = "ap-south-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"
  key_name                             = "APP"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-04033707631c67216"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.32.3.126"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-029ceac41f59c6587_id}"

  tags = {
    Name = "DB"
  }

  tags_all = {
    Name = "DB"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--DB_sg-042b85cdaa391bf0a_id}"]
}

resource "aws_instance" "tfer--i-07d2f411d5ce4c833_server2" {
  ami                         = "ami-07a00cf47dbbc844c"
  associate_public_ip_address = "false"
  availability_zone           = "ap-south-1a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"
  key_name                             = "mumbai"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-0478f06f8a0f6ab84"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "true"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.31.42.188"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  security_groups   = ["launch-wizard-2"]
  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-00f5f3969e681f05c_id}"

  tags = {
    Name = "server2"
  }

  tags_all = {
    Name = "server2"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--launch-wizard-2_sg-0505ef4d93d3b99c4_id}"]
}

resource "aws_instance" "tfer--i-09b2834a446f25c5f_APP-Frontend" {
  ami                         = "ami-07a00cf47dbbc844c"
  associate_public_ip_address = "false"
  availability_zone           = "ap-south-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"
  key_name                             = "APP"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-01647a4570f882275"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.32.2.32"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0f4f1bc3197896124_id}"

  tags = {
    Name = "APP-Frontend"
  }

  tags_all = {
    Name = "APP-Frontend"
  }

  tenancy                = "default"
  user_data_base64       = "IyEvYmluL2Jhc2gKYXB0LWdldCB1cGRhdGUgLXkKYXB0LWdldCBpbnN0YWxsIC15IG5naW54CnN5c3RlbWN0bCBzdGFydCBuZ2lueApzeXN0ZW1jdGwgZW5hYmxlIG5naW54CmVjaG8gIjxoMT5OZ2lueCBpcyBydW5uaW5nIG9uICQoaG9zdG5hbWUpPC9oMT4iID4gL3Zhci93d3cvaHRtbC9pbmRleC5odG1sCg=="
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--APP-Frontend_sg-0592ea2263a80be04_id}"]
}

resource "aws_instance" "tfer--i-0a02e1f6b18a300c0_APP-Backend2" {
  ami                         = "ami-07a00cf47dbbc844c"
  associate_public_ip_address = "false"
  availability_zone           = "ap-south-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"
  key_name                             = "APP"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-0cf1e404ba77b85fe"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.32.10.176"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-045142dc209ca5656_id}"

  tags = {
    Name = "APP-Backend2"
  }

  tags_all = {
    Name = "APP-Backend2"
  }

  tenancy                = "default"
  user_data_base64       = "YXB0IHVwZGF0ZSAteQphcHQgaW5zdGFsbCBvcGVuamRrLTIxLWpkayAteQ=="
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--APP-Backend_sg-0a3f5866ca01859b3_id}"]
}

resource "aws_instance" "tfer--i-0d8deec2f510e4d26_Server-Bastion" {
  ami                         = "ami-07a00cf47dbbc844c"
  associate_public_ip_address = "true"
  availability_zone           = "ap-south-1b"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = "0"
  key_name                             = "APP"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-0593f16f9bdeb9fc5"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "10.0.1.151"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-0ad6b66902b1c27df_id}"

  tags = {
    Name = "Server-Bastion"
  }

  tags_all = {
    Name = "Server-Bastion"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--launch-wizard-3_sg-01e31f7b4dc5c1c70_id}"]
}

resource "aws_instance" "tfer--i-0d9165454a5e63bc9_Server1" {
  ami                         = "ami-02eb0c2388ee999f9"
  associate_public_ip_address = "true"
  availability_zone           = "ap-south-1a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "1"
    threads_per_core = "2"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.small"
  ipv6_address_count                   = "0"
  key_name                             = "mumbai"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  primary_network_interface {
    network_interface_id = "eni-0a34f96d35e3016fc"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "true"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.31.35.38"
  region     = "ap-south-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  security_groups   = ["launch-wizard-1"]
  source_dest_check = "true"
  subnet_id         = "${data.terraform_remote_state.subnet.outputs.aws_subnet_tfer--subnet-00f5f3969e681f05c_id}"

  tags = {
    Name = "Server1"
  }

  tags_all = {
    Name = "Server1"
  }

  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--launch-wizard-1_sg-0558f577b6970253b_id}"]
}
