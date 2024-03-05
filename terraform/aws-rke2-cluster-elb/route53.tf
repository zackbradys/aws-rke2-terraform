data "aws_route53_zone" "aws_rke2_zone" {
  name = var.domain
}

resource "aws_route53_record" "aws_rke2_record_rke2" {
  zone_id = data.aws_route53_zone.aws_rke2_zone.zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = aws_elb.aws_rke2_elb.dns_name
    zone_id                = aws_elb.aws_rke2_elb.zone_id
    evaluate_target_health = false
  }
  depends_on = [aws_elb.aws_rke2_elb]
}

resource "aws_route53_record" "aws_rke2_record_ingress" {
  zone_id = data.aws_route53_zone.aws_rke2_zone.zone_id
  name    = "*"
  type    = "A"
  alias {
    name                   = aws_elb.aws_rke2_ingress_elb.dns_name
    zone_id                = aws_elb.aws_rke2_ingress_elb.zone_id
    evaluate_target_health = false
  }
  depends_on = [aws_elb.aws_rke2_ingress_elb]
}
