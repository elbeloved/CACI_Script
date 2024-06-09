output "stack_vpc_id" {
    value = aws_vpc.CACI.id
}

output "private_subnet" {
    value = "${aws_subnet.private_CACI_1a[*].id}"
}

