resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "eks-vpc"
    }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.eks_vpc.id
  cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1b"
  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    Name = "eks-igw"
  }
}

resource "aws_route_table" "eks_route_table" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_route" "internet_access" {
  route_table_id = aws_route_table.eks_route_table.id
  destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
}

resource "aws_route_table_association" "public_1"{
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.eks_route_table.id
}

resource "aws_route_table_association" "public_2"{
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.eks_route_table.id
}