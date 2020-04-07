
resource "aws_security_group" "public-bastion" {
  name   = "Propitix-bastion-security-group"
  description = "SSH Access to the bastion server"
  vpc_id = aws_vpc.propitix_vpc.id
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # ICMP access from anywhere
  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        "Name"           = "Propitix-bastion-security-group",
        "Managed By"     = "Terraform",
        "Resource"       = "Security Group",
        "Project"        = "Propitix"
    }
}



resource "aws_security_group" "public-http" {
  name   = "Propitix-http-security-group"
  description = "HTTP/HTTPS Access to the bastion server"
  vpc_id = aws_vpc.propitix_vpc.id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ICMP access from anywhere
  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        "Name"           = "Propitix-public-security-group",
        "Managed By"     = "Terraform",
        "Resource"       = "Security Group",
        "Project"        = "Propitix"
    }
}



resource "aws_security_group" "private-http" {
  name   = "Propitix-webserver-security-group"
  description = "HTTP/HTTPS Access to the webserver server"
  vpc_id = aws_vpc.propitix_vpc.id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        "Name"           = "Propitix-webserver-security-group",
        "Managed By"     = "Terraform",
        "Resource"       = "Security Group",
        "Project"        = "Propitix"
    }
}
