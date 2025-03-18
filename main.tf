
resource "aws_instance" "instance" {
  for_each = var.components
  ami  = data.aws_ami.ami.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = data.aws_security_groups.sg.ids
  tags = {
    Name = "${each.key}-dev" # Tag the instance with a Name tag for easier identification
  }
}

resource "aws_route53_record" "dns-record" {
  for_each = var.components
  zone_id = data.aws_route53_zone.zone.zone_id
  name     = "${each.key}.dev.${var.domain_name}"
  type = var.type
  ttl = var.ttl
  records = [aws_instance.instance[each.key].private_ip]

}


