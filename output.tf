# Load balancers URL address to connect to the applications
output "main_lb_dns_name" {
  value = module.ec2.main_lb_dns_name
}
/*output "second_elb_dns_name" {
  value = module.ec2.second_elb_dns_name
}*/