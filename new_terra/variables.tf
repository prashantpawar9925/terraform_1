variable "aws_image_id" {
 
 default = "ami-02c7683e4ca3ebf58"
 type = string
 
}

variable "aws_instance_type" {

  default = "t2.micro"
  type = string
 
}

variable "aws_default_volume_size" {
  
  default = 8
  type = number

}

variable "aws_volume_type" {
  default = "gp3"
  type = string

}

variable "env" {
 default = "dev"
 type = string

}

