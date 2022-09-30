module "name" {
  source = "git::https://github.com/s3d-club/terraform-external-data-name-tags?ref=v0.1.0"

  name_prefix  = var.name_prefix
  name_segment = "ingress-ssh"
  path         = path.module
  tags         = var.tags
}

resource "aws_security_group" "this" {
  description = "Allow SSH inbound traffic"
  name_prefix = module.name.name_prefix
  tags        = module.name.tags
  vpc_id      = var.vpc

  ingress {
    cidr_blocks      = var.cidr
    description      = "SSH Access"
    from_port        = 22
    ipv6_cidr_blocks = var.cidr6
    protocol         = "tcp"
    to_port          = 22
  }
}
