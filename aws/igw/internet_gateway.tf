resource "aws_internet_gateway" "tfer--igw-016df6863f9a88eba" {
  region = "ap-south-1"

  tags = {
    Name = "igw-Bation"
  }

  tags_all = {
    Name = "igw-Bation"
  }

  vpc_id = "vpc-0c1fc7a742a040dee"
}

resource "aws_internet_gateway" "tfer--igw-0b521a0fb544c7de2" {
  region = "ap-south-1"
  vpc_id = "vpc-0dea0bee6eb53fc42"
}

resource "aws_internet_gateway" "tfer--igw-0b78226c096f831b0" {
  region = "ap-south-1"

  tags = {
    Name = "igw-APP"
  }

  tags_all = {
    Name = "igw-APP"
  }

  vpc_id = "vpc-040f940eeea978cf5"
}
