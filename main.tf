
resource "aws_instance" "frontend-dev" {
  ami  = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0d20a12665e2ec64c"]
  tags = {
    Name = "frontend-dev" # Tag the instance with a Name tag for easier identification
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z0217682200043ETYLGYJ"
  name = "frontend.dev.codedeploywithbharath.tech"
  type = "A"
  ttl = "15"
  records = [aws_instance.frontend-dev.private_ip]

}


resource "aws_instance" "mongo-dev" {
  ami  = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0d20a12665e2ec64c"]
  tags = {
    Name = "mongo" # Tag the instance with a Name tag for easier identification
  }

}

resource "aws_route53_record" "mongo" {
  zone_id = "Z0217682200043ETYLGYJ"
  name = "mongo.dev.codedeploywithbharath.tech"
  type = "A"
  ttl = "15"
  records = [aws_instance.mongo-dev.private_ip]
}


resource "aws_instance" "catalogue" {
  ami  = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0d20a12665e2ec64c"]
  tags = {
    Name = "catalogue" # Tag the instance with a Name tag for easier identification
  }

}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z0217682200043ETYLGYJ"
  name = "catalogue.dev.codedeploywithbharath.tech"
  type = "A"
  ttl = "15"
  records = [aws_instance.catalogue.private_ip]
}