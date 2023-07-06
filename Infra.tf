terraform {
required_providers {
aws = {
source  = "hashicorp/aws"
version = "~> 4.0"
}
}
}

terraform {
  backend "s3" {
    bucket = "terraform-state-file-bucket-6th-july"
    key    = "terraform-infra-file.tf"
    region = "ap-south-1"
  }
}

# Configure the AWS Provider
provider "aws" {
region = "ap-south-1"

}

#resource "aws_instance" "example" {
#ami           = "ami-0b9ecf71fe947bbdd"
#instance_type = "t2.micro"
#key_name = "Demo_28th June"
#tags = {
#Name = "Hello siri"
#}
#}

# Creating Hyd vpc
# resource "aws_vpc" "Hyd-vpc" {
#   cidr_block       = "10.0.0.0/16"
  
#   tags = {
#     Name = "Hyd-vpc"
#   }
# }

# # Creating subnet resources
# resource "aws_subnet" "Hyd-subnet-1a" {
#   vpc_id     = aws_vpc.Hyd-vpc.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "ap-south-1a"
#   map_public_ip_on_launch = "true"

#   tags = {
#     Name = "Hyd-subnet-1a"
#   }
# }

# # creating ec2 instances
# resource "aws_instance" "Hyd-instance" {
#   ami           = "ami-0b9ecf71fe947bbdd"
#   instance_type = "t2.micro"
  #key_name = aws_key_pair.Hyd_key-pair.id
#   subnet_id = aws_subnet.Hyd-subnet-1a.id
#   associate_public_ip_address = "true"
#   vpc_security_group_ids = [aws_security_group.Hyd_SG_allow_ssh_http.id]

#   tags = {
#     Name = "Hyd-instance"
#   }
# }

# # creating key pair
# resource "aws_key_pair" "Hyd-key-pair" {
#   key_name   = "Hyd-1st-july"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC97gC1ckvucS5xvy3rmZw6xlQljZyb0ChTJ9Dh8wGVzEFbc4sZavNOwHXw0CiK8xm2g+06M89DMs1rAf65kFTtrhOpjOogvfw4pWXFB5boCRhMxA4N1QTlHT4ND7OBAkFJKVQOtjzdfcH6EQytcg3UNrXnMir0Rg3b+d82oho3IzcxVl6HrU0LlwOrudqDvVPmiWKXTPgn33addvFaW3W1ZsPP2x8xHlSCLt3Lv+gMj2L4U3KjGs56hb8qi1eQHE9+GwgxCiOPbG2zlyQ4NhIaG4KZi7I5UTDMHVeH5W4JQqa3uIU9eTKW+GyFF5pW+uboTVNBLjMFjGtAInpWBEP3PZrT45BganhRJFxTOwpNYxNredtwgi1jCVS7tLyPLSOArN07ephOUbsleNsxguFDVmM5mbonCQ2VPOkrmH0ytcEjZph8yBhZRkKeGP/Pj8pzGlf5TIvQ2bR5WcRWSaNEhJmXoAnpOOnf3eXK1UyWxyIKOlrbkZu4gGKlwl6ormM= SAI VAMSHI RAGIPHANI@LAPTOP-3EGS8N0K"

# }

# # Creating security group
# resource "aws_security_group" "Hyd_SG_allow_ssh_http" {
#   name        = "allow_ssh_http"
#   description = "Allow SSH and HTTP inbound traffic"
#   vpc_id      = aws_vpc.Hyd-vpc.id

#   ingress {
#     description      = "ssh from VPC"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
#     ingress {
#     description      = "HTTP from PC"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_ssh_http"
#   }
# }

# Project

# creating VPC
resource "aws_vpc" "mumbai-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "mumbai-vpc"
  }
}

# creating subnet resources
resource "aws_subnet" "mumbai-subnet-1a-pub" {
  vpc_id     = aws_vpc.mumbai-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "mumbai-subnet-1a"
  }
}

resource "aws_subnet" "mumbai-subnet-1a" {
  vpc_id     = aws_vpc.mumbai-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "mumbai-subnet-1a"
  }
}

resource "aws_subnet" "mumbai-subnet-1b-pub" {
  vpc_id     = aws_vpc.mumbai-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "mumbai-subnet-1b"
  }
}

resource "aws_subnet" "mumbai-subnet-1b" {
  vpc_id     = aws_vpc.mumbai-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "mumbai-subnet-1b"
  }
}

# creating security group
resource "aws_security_group" "mumbai_SG_allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.mumbai-vpc.id

  ingress {
    description      = "ssh from PC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "HTTP from PC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}

# creating Internet gateway

resource "aws_internet_gateway" "mumbai-IG" {
  vpc_id = aws_vpc.mumbai-vpc.id

  tags = {
    Name = "mumbai-IG"
  }
}

# creating the RT 
resource "aws_route_table" "mumbai-RT-pub" {
  vpc_id = aws_vpc.mumbai-vpc.id

  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mumbai-IG.id
  }

  tags = {
    Name = "mumbai-RT-pub"
  }
}

resource "aws_route_table" "mumbai-RT-2" {
  vpc_id = aws_vpc.mumbai-vpc.id


  tags = {
    Name = "mumbai-RT-2"
  }
}

resource "aws_route_table_association" "mumbai-RT-association-1" {
  subnet_id      = aws_subnet.mumbai-subnet-1a-pub.id
  route_table_id = aws_route_table.mumbai-RT-pub.id
}

resource "aws_route_table_association" "mumbai-RT-association-2" {
  subnet_id      = aws_subnet.mumbai-subnet-1b-pub.id
  route_table_id = aws_route_table.mumbai-RT-pub.id
}

resource "aws_route_table_association" "mumbai-RT-association-3" {
  subnet_id      = aws_subnet.mumbai-subnet-1a.id
  route_table_id = aws_route_table.mumbai-RT-2.id
}

resource "aws_route_table_association" "mumbai-RT-association-4" {
  subnet_id      = aws_subnet.mumbai-subnet-1b.id
  route_table_id = aws_route_table.mumbai-RT-2.id
}

# creating key pair
 resource "aws_key_pair" "mumbai-key-pair" {
  key_name   = "mumbai-4th-july"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJvrl0fQfsWEwC26h6vNIeNK76W8YThEd/edUhPnz6g7R2M4inTbMSgzKax4RM16UmG4ES7Jd3XjrsxhGwOo2+wE1+VlCHRnsDE3QrGSctWt7+kiaT+38PqDJMLvgd5CUZsJg7+f5SPHWJrB8qxG9xjA6+uK3FyJzYIC2QxGO4M2ROoUoAwEVQ/xpDQ9hwmcPS+k7tMHozFNrZpkysXhZoDSo/QTR69gyNW9ERX1DDxrZXCcsbmHmJGDgReM+o6hI8aI80J5FqspqptcCAkAR54KwUuMmCdRonie2JzVWeEso6xDJV7gn+s0D6OPxH/mqq5vVk1rq1HrfsQKOaHoPYbHPGqHd1glEBvqIJf7OedIVMBBXQFbb57PJxnV4HbuJDVqbF6gV0IG8JjhEVd/1yENLjsx988/aw1DiwIIelVSWoWQlSFRgNo8lxWyLnVg03EMtRX14plHMH7giDajUJD9k9bRZzYckfkdVz/zB6ckttepC95hCd4ZtXT7do7Qc= SAI VAMSHI RAGIPHANI@LAPTOP-3EGS8N0K"
}

# creating target group
resource "aws_lb_target_group" "mumbai-TG" {
  name     = "Terraform-project"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mumbai-vpc.id
}

# creating launch template 
resource "aws_launch_template" "mumbai-LT" {
  name = "mumbai-LT"

  image_id = "ami-0f5ee92e2d63afc18"

  instance_type = "t2.micro"


  key_name = aws_key_pair.mumbai-key-pair.id

  monitoring {
    enabled = true
  }

  placement {
    availability_zone = "us-west-2a"
  }

  vpc_security_group_ids = [aws_security_group.mumbai_SG_allow_ssh_http.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "mumbai-instance-ASG"
    }
  }

  user_data = filebase64("userdata.sh")
}

# creating ASG 
resource "aws_autoscaling_group" "mumbai-ASG" {
vpc_zone_identifier = [aws_subnet.mumbai-subnet-1a-pub.id,aws_subnet.mumbai-subnet-1b-pub.id]
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.mumbai-LT.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.mumbai-TG.arn]
}

# creating listener with ASG
resource "aws_lb_listener" "mumbai-listener" {
  load_balancer_arn = aws_lb.mumbai-LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mumbai-TG.arn
  }
}

# creating load balancer with ASG
resource "aws_lb" "mumbai-LB" {
  name               = "Mumbai-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mumbai_SG_allow_ssh_http.id]
  subnets            = [aws_subnet.mumbai-subnet-1a-pub.id, aws_subnet.mumbai-subnet-1b-pub.id]


  tags = {
    Environment = "production"
  }
}