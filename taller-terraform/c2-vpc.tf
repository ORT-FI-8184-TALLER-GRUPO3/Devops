# Resource Block
# Resource-1: Crear VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-dev"
  }
}

# Resource-2: Crear Subnets
resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id = aws_vpc.vpc-dev.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}


# Resource-3: Crear Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource-4: Crear Route Table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Resource-5: Crear Route en Route Table para acceso a internet
resource "aws_route" "vpc-dev-public-route" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id 
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-dev-igw.id 
}


# Resource-6: Asociar Route Table con la Subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id 
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
}

# Resource-7: Crear Security Group
resource "aws_security_group" "dev-vpc-sg" {
  name = "dev-vpc-default-sg"
  vpc_id = aws_vpc.vpc-dev.id
  description = "Dev VPC Default Security Group"

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "Allow Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
