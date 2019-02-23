resource "aws_vpc" "vpc" {
  cidr_block = "10.1.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags ={
    Name = "mynew-VPC"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
        Name =  "mypublic subnet"
      }
}
resource "aws_subnet" "private_subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "10.1.2.0/24"
  availability_zone       = "us-east-1b"
  tags = {
        Name =  "myprivate subnet"
      }
}
