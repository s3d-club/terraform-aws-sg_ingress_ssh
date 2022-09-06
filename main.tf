data "aws_vpc" "this" {
  default = true
}

resource "aws_security_group" "this" {
  name_prefix = "allow-ssh-"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.this.id

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }
}
