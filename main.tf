
resource "aws_instance" "frontend-dev" {
  ami  = data.aws_ami.ami
  instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_groups.sg
  tags = {
    Name = "frontend-dev" # Tag the instance with a Name tag for easier identification
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.zone
  name = "frontend.dev.${var.domain_name}"
  type = var.type
  ttl = var.ttl
  records = [aws_instance.frontend-dev.private_ip]

}


resource "aws_instance" "mongo-dev" {
  ami  = data.aws_ami.ami
  instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_groups.sg
  tags = {
    Name = "mongo" # Tag the instance with a Name tag for easier identification
  }

}

resource "aws_route53_record" "mongo" {
  zone_id = data.aws_route53_zone.zone
  name = "mongo.dev.${var.domain_name}"
  type = var.type
  ttl = var.ttl
  records = [aws_instance.mongo-dev.private_ip]
}


resource "aws_instance" "catalogue" {
  ami  = data.aws_ami.ami
  instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_groups.sg
  tags = {
    Name = "catalogue" # Tag the instance with a Name tag for easier identification
  }

}

resource "aws_route53_record" "catalogue" {
  zone_id = data.aws_route53_zone.zone
  name = "catalogue.dev.${var.domain_name}"
  type = var.type
  ttl = var.ttl
  records = [aws_instance.catalogue.private_ip]
}