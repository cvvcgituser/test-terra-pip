output "vpc_id" {
    value = aws_vpc.my-vpc.id
}

output "subnet-id-1" {
    value = aws_subnet.web-subnet-1
}

output "subnet-id-2" {
    value = aws_subnet.web-subnet-2
}

output "database-subnet-1" {
    value = aws_subnet.database-subnet-1
}

output "database-subnet-2" {
    value = aws_subnet.database-subnet-2
}
