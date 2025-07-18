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

 ami = "ami-02c7683e4ca3ebf58"
 instance_type = "t2.micro"
 vpc_security_group_ids = [aws_security_group.my-sg.id]
 key_name = aws_key_pair.my-key.key_name
 
 root_block_device  { 
   volume_size = 8
   volume_type = "gp3"
   
   tags = {
      Name        = "TF_ebs_root"
      Environment = "dev"
    }

}

  tags = {
    Name = "TF_instance"
    Environment = "dev"
  }

}
