resource "aws_route53_zone" "internal" {
  name = "internal"

  vpc {
    vpc_id = aws_vpc.internal_vpc.id
  }
}

resource "aws_route53_record" "primary" {
  zone_id = aws_route53_zone.internal.zone_id
  name    = "${var.primary_dns_name}.internal"
  type    = "A"
  ttl     = 300
  records = [aws_instance.webserver.private_ip]
}

resource "aws_route53_record" "secondary" {
  zone_id = aws_route53_zone.internal.zone_id
  name    = "${var.secondary_dns_name}.internal"
  type    = "A"
  ttl     = 300
  records = [aws_instance.webserver.private_ip]
}