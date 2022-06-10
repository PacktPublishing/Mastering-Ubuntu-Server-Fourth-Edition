provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my-server-1" {
    ami                                   = "ami-09d56f8956ab235b3"
    associate_public_ip_address           = "true"
    instance_type                         = "t2.micro"
    key_name                              = "jay_ssh"
    vpc_security_group_ids                = [   "${aws_security_group.external_access.id}" ]
    tags = {
      Name = "Web Server 1"
    }
}

resource "aws_security_group" "external_access" {
    name             = "my_sg"
    description = "Allow OpenSSH and Apache"
    ingress {
        from_port    = 22
        to_port      = 22
        protocol     = "tcp"
        cidr_blocks  = [ "172.11.59.105/32" ]
        description  = "Home Office IP"
    }

    ingress {
        from_port    = 80
        to_port      = 80
        protocol     = "tcp"
        cidr_blocks  = [ "172.11.59.105/32" ]
        description  = "Home Office IP"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
