# To create key pair for login
resource "aws_key_pair" "my-key" {
 key_name   = "prashant-key"
 public_key = file("prashant-key.pub")

}

# defualt vpc

resource "aws_default_vpc" "default" {

}

# To create Security groups

resource "aws_security_group" "my-sg" {
  name        = "web-sg"
  description = "Allow inbound traffic and outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "TF_SG"
  }

 ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

}

# To create ec2 instance

resource "aws_instance" "my-instance" {
 for_each = tomap({

  TF_instance_micro = "t2.micro",
  TF_instance_small = "t2.small"

 }) # meta argument

 ami = var.aws_image_id
 instance_type = each.value
 vpc_security_group_ids = [aws_security_group.my-sg.id]
 key_name = aws_key_pair.my-key.key_name
 
 root_block_device  { 
   volume_size = var.aws_volume_size 
   volume_type = var.aws_volume_type
   
   tags = {
      Name        = each.key
      Environment = "dev"
    }

}

  tags = {
    Name = each.key
  }

}
