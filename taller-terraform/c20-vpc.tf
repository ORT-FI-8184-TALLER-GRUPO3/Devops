# Resource Block
# Resource-1: Crear VPC
resource "aws_vpc" "vpc-ecs" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "${var.environment_prefix}-vpc"
  }
}

# Resource-2: Crear Subnets
resource "aws_subnet" "vpc-ecs-public-subnet-1" {
  vpc_id = aws_vpc.vpc-ecs.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true
}


# Resource-3: Crear Internet Gateway
resource "aws_internet_gateway" "vpc-ecs-igw" {
  vpc_id = aws_vpc.vpc-ecs.id
}

# Resource-4: Crear Route Table
resource "aws_route_table" "vpc-ecs-public-route-table" {
  vpc_id = aws_vpc.vpc-ecs.id
}

# Resource-5: Crear Route en Route Table para acceso a internet
resource "aws_route" "vpc-ecs-public-route" {
  route_table_id = aws_route_table.vpc-ecs-public-route-table.id 
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-ecs-igw.id 
}


# Resource-6: Asociar Route Table con la Subnet
resource "aws_route_table_association" "vpc-ecs-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-ecs-public-route-table.id 
  subnet_id = aws_subnet.vpc-ecs-public-subnet-1.id
}

# Resource-7: Crear Security Group
resource "aws_security_group" "ecs-vpc-sg" {
  name = "${var.environment_prefix}-vpc-default-sg"
  vpc_id = aws_vpc.vpc-ecs.id
  description = "${var.environment_name} - VPC Default Security Group"

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
