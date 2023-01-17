resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr-block
  tags = {
    "Name" = var.vpc-name
  }
}

resource "aws_subnet" "main" {
  count = length(var.subnet-name)
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet-cidr-block[count.index]
  tags = {
    "Name" = var.subnet-name[count.index]
  }
  availability_zone = var.availability-zone
}

# Define the public route table
resource "aws_route_table" "main" {
  count = length(var.subnet-name)  
  vpc_id = aws_vpc.main.id
}

# Associate the public route table to the public subnet
resource "aws_route_table_association" "main" {
  count = length(var.subnet-name)  
  subnet_id = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.main[count.index].id
}