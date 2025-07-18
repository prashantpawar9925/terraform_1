/*
# for multiple instances if use "count"
output "public_ip" {

 value = aws_instance.my-instance[*].public_ip

}
# for multiple instances if use "count"
output "public_dns" {

 value = aws_instance.my-instance[*].public_dns

}

# for multiple instances if use "count"
output private_ip {

 value = aws_instance.my-instance[*].private_ip

}
# for multiple instances if use "count"
output "private_dns" {

 value = aws_instance.my-instance[*].private_dns

}
*/

# For multiple instances if use "for_each"
output "public_ip" {
  value = [
    for instance in aws_instance.my-instance : instance.public_ip
  ]
}


