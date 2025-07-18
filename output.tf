output "public_ip" {

 value = aws_instance.my-instance.public_ip

}

output "public_dns" {

 value = aws_instance.my-instance.public_dns

}


output private_ip {

 value = aws_instance.my-instance.private_ip

}

output "private_dns" {

 value = aws_instance.my-instance.private_dns

}

