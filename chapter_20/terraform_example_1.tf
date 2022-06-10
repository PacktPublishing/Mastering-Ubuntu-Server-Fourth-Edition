provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my-server-1" {
    ami                                   = "ami-09d56f8956ab235b3"
    associate_public_ip_address           = "true"
    instance_type                         = "t2.micro"
    key_name                              = "jay_ssh"
    vpc_security_group_ids                = [ "sg-0597d57383be308b0" ]
    tags = {
        Name = "Web Server 1"
    }
}
