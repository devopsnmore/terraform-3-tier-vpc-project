# create vpc
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block             = var.vpc_cidr
  instance_tenancy       = "default"
  enable_dns_hostnames   = true

  tags      = {
    Name    = "dev vpc"
  }
}

# create internet gateway and attach it to vpc
# terraform aws create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags      = {
    Name    = "dev igw"
  }
}

# create public subnet az2a
# terraform aws create public subnet
resource "aws_subnet" "pub_subnet_az2a" {
    vpc_id                   = aws_vpc.vpc.id
    cidr_block               = var.pub_subnet_az2a_cidr
    availability_zone        = "us-east-2a"
    map_public_ip_on_launch  = true

    tags   = {
      Name = "pub_subnetaz2a"
    }
}

# create public subnet az2b
# terraform aws create public subnet
resource "aws_subnet" "pub_subnet_az2b" {
    vpc_id                   = aws_vpc.vpc.id
    cidr_block               = var.pub_subnet_az2b_cidr
    availability_zone        = "us-east-2b"
    map_public_ip_on_launch  = true

    tags   = {
      Name = "pub_subnetaz2b"
    }
}

# create route table and add public route
# terraform aws create route table
resource "aws_route_table" "pub_route_table" {
  vpc_id        = aws_vpc.vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.igw.id
  }

  tags      = {
    Name    = "pub_route_table"
 }
}

# associate public subnet az2a to "pub_route_table"
# terraform awsassociate subnet with route table
resource "aws_route_table_association" "pub_subnet_az2a_route_table_association" {
    subnet_id       = aws_subnet.pub_subnet_az2a.id
    route_table_id  = aws_route_table.pub_route_table.id
}

# associate public subnet az2a to "pub_route_table"
# terraform awsassociate subnet with route table
resource "aws_route_table_association" "pub_subnet_az2b_route_table_association" {
    subnet_id       = aws_subnet.pub_subnet_az2b.id
    route_table_id  = aws_route_table.pub_route_table.id
}

# create private app subnet az2a
# terraform create aws create subnet
resource "aws_subnet" "priv_app_subnet_az2a" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.priv_app_subnet_az2a_cidr
    availability_zone       = "us-east-2a"
    map_public_ip_on_launch = false

    tags    = {
      Name  = "private app subnet az2a"
    }
}

# create private app subnet az2b
# terraform create aws create subnet
resource "aws_subnet" "priv_app_subnet_az2b" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.priv_app_subnet_az2b_cidr
    availability_zone       = "us-east-2b"
    map_public_ip_on_launch = false

    tags      = {
      Name    = "private app subnet az2b"
    }
}

# create private data subnet az2a
# terraform aws create subnet
resource "aws_subnet" "priv_data_subnet_az2a" {
  vpc_id                    = aws_vpc.vpc.id
  cidr_block                = var.priv_data_subnet_az2a_cidr
  availability_zone         = "us-east-2a"
  map_public_ip_on_launch   = false

  tags   = {
    Name = "private data subnet az2a"
    }
}

# create private data subnet az2a
# terraform aws create subnet
resource "aws_subnet" "priv_data_subnet_az2b" {
  vpc_id                     = aws_vpc.vpc.id
  cidr_block                 = var.priv_data_subnet_az2b_cidr
  availability_zone          = "us-east-2b"
  map_public_ip_on_launch    = false

  tags   = {
    Name = "private data subnet az2b"
    }
}