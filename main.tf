
resource "aws_instance" "frontend" {
  ami  = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0d20a12665e2ec64c"]
  tags = {
    Name = "frontend" # Tag the instance with a Name tag for easier identification
  }

}
resource "aws_instance" "mongo" {
  ami  = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0d20a12665e2ec64c"]
  tags = {
    Name = "frontend" # Tag the instance with a Name tag for easier identification
  }

}

resource "aws_instance" "catalogue" {
  ami  = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0d20a12665e2ec64c"]
  tags = {
    Name = "frontend" # Tag the instance with a Name tag for easier identification
  }

}