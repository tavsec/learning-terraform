provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "web" {
    name = "Web Server SG"
    description = "Allow HTTP and HTTPS requests"

    dynamic "ingress" {
        for_each = ["8080", "80", "443", "1000"]
        content {
            description = "Allow HTTP"
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    
    egress {
        description = "Allow all traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        name = "Terraform EC2"
    }
}