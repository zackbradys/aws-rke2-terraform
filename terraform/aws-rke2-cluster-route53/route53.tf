data "aws_route53_zone" "aws_rke2_zone" {
  name = var.domain
}

resource "aws_route53_record" "aws_rke2_record_rke2" {
  zone_id = data.aws_route53_zone.aws_rke2_zone.zone_id
  name    = ""
  type    = "A"
  ttl     = 300
  records = [aws_instance.aws_ec2_instance_control.*.public_ip, aws_instance.aws_ec2_instance_controls.*.public_ip]
}

resource "aws_route53_record" "aws_rke2_record_ingress" {
  zone_id = data.aws_route53_zone.aws_rke2_zone.zone_id
  name    = "*"
  type    = "CNAME"
  ttl     = 300
  records = [var.domain]
}
