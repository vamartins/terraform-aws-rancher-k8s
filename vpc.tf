resource "aws_vpc" "main" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames

  tags = {
    Name = "awslab-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.publicsCIDRblock
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZone

  tags = {
    Name = "awslab-subnet-public"
  }
}

resource "aws_network_acl" "public_NACL" {
  vpc_id     = aws_vpc.main.id
  subnet_ids = [aws_subnet.public_subnet.id]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.publicdestCIDRblock
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.publicdestCIDRblock
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.publicdestCIDRblock
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = var.publicdestCIDRblock
    from_port  = 32768
    to_port    = 61000
  }

  ingress {
    protocol   = "icmp"
    rule_no    = 500
    action     = "allow"
    cidr_block = var.publicdestCIDRblock
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "public NACL"
  }
}

resource "aws_internet_gateway" "awslab_IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "awslab-internet-gateway"
  }
}

resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Public Route table"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_RT.id
  destination_cidr_block = var.publicdestCIDRblock
  gateway_id             = aws_internet_gateway.awslab_IGW.id

}

resource "aws_route_table_association" "route_public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_RT.id
}