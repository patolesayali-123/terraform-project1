resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name= "terraform-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.mainvpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.az

  tags = {
    Name="public-subnet"
  }
  map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name="my-igw"
  }
}

resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.mainvpc.id

  route  {
    cidr_block="0.0.0.0/0"
    gateway_id= aws_internet_gateway.myigw.id
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.publicrt.id
}