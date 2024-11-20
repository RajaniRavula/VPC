output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "private_subnets" {
  value = aws_subnet.private.*.id
}

output "ec2_instance_ids" {
  value = aws_instance.web.*.id
}

output "load_balancer_dns" {
  value = aws_lb.app_lb.dns_name
}