variable "ami" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_security_group_ids" {
  default = ["sg-0d20a12665e2ec64c"]
}

variable "zone_id" {
  default = "Z0217682200043ETYLGYJ"
}

variable "ttl" {
  default = "15"
}

variable "domain_name" {
  default = "codedeploywithbharath.tech"
}

variable "type" {
  default = "A"
}
