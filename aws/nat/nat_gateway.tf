resource "aws_nat_gateway" "tfer--nat-1446a39aa145b68c8" {
  availability_mode = "regional"
  connectivity_type = "public"
  region            = "ap-south-1"

  tags = {
    Name = "NGW-APP"
  }

  tags_all = {
    Name = "NGW-APP"
  }

  vpc_id = "vpc-040f940eeea978cf5"
}
