
resource "aws_instance" "instance" {
  count = length(var.components)
  ami  = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_groups.sg.ids
  tags = {
    Name = "${var.components[count.index]}-dev" # Tag the instance with a Name tag for easier identification
  }
}

resource "aws_route53_record" "dns-record" {
  count = length(var.components)
  zone_id = data.aws_route53_zone.zone.zone_id
  name = "${var.components[count.index]}.dev.${var.domain_name}"
  type = var.type
  ttl = var.ttl
  records = [aws_instance.instance[count.index].private_ip]

}


