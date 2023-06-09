resource "aws_route53_zone" "aws_rke2_zone" {
  name          = var.domain
  force_destroy = true
  comment       = "AWS RKE2 Route53 Hosted Zone"
}

resource "aws_route53_record" "aws_rke2_record_rke2" {
  zone_id = aws_route53_zone.aws_rke2_zone.zone_id
  name    = ""
  type    = "A"
  ttl     = 300
  records = [aws_eip.aws_eip_control.*.public_ip, aws_eip.aws_eip_controls.*.public_ip]
}

resource "aws_route53_record" "aws_rke2_record_ingress" {
  zone_id = aws_route53_zone.aws_rke2_zone.zone_id
  name    = "*"
  type    = "CNAME"
  ttl     = 300
  records = [var.domain]
}