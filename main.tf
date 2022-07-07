resource "aws_security_group" "webserver" {
  name        = "${var.basename}-webserver-${var.type}"
  description = "Rules to apply to webservers of type ${var.type}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.basename}-webserver-${var.type}-sg"
  }
}

resource "aws_security_group_rule" "ingress-http-ipv4" {
  security_group_id = aws_security_group.webserver.id
  type              = "ingress"
  cidr_blocks       = var.allow_http_cidr_blocks
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  description       = "IPv4 ingress (http)"
}

resource "aws_security_group_rule" "ingress-https-ipv4" {
  security_group_id = aws_security_group.webserver.id
  type              = "ingress"
  cidr_blocks       = var.allow_https_cidr_blocks
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  description       = "IPv4 ingress (https)"
}

resource "aws_security_group_rule" "ingress-http-ipv6" {
  security_group_id = aws_security_group.webserver.id
  type              = "ingress"
  ipv6_cidr_blocks  = var.allow_http_ipv6_cidr_blocks
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  description       = "IPv6 ingress (http)"
}

resource "aws_security_group_rule" "ingress-https-ipv6" {
  security_group_id = aws_security_group.webserver.id
  type              = "ingress"
  ipv6_cidr_blocks  = var.allow_https_ipv6_cidr_blocks
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  description       = "IPv6 ingress (https)"
}
