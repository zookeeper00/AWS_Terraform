output "vpc_id" {
    value = module.vpc.vpc_id
    description = "value of vpc id"
}

output "public_subnet_id" {
    value = module.vpc.public_subnet_id
    description = "value of public subnet id"
}

output "ec2_instance_id" { 
    value = module.ec2.instance_id
    description = "value of ec2 instance id"
}
