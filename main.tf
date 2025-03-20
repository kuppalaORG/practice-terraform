
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
  name     = "${each.key}.${var.domain_name}"
  type = var.type
  ttl = var.ttl
  records = [aws_instance.instance[each.key].private_ip]

}

resource "null_resource" "ansible" {
  depends_on = [aws_route53_record.dns-record]
  for_each   = var.components

  provisioner "remote-exec" {
    connection {
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.instance[each.key].private_ip
    }

    inline = [
      "sudo pip-3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/raghudevopsb80/roboshop-ansible main.yml -e env=dev -e role_name=${each.key}"
    ]

  }
}


