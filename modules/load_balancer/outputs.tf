output "lb_id" {
  value       = azurerm_lb.lb.id
  description = "The ID of the Load Balancer"
}

output "public_ip" {
  value       = azurerm_public_ip.public_ip_lb.ip_address
  description = "The public IP address of the Load Balancer"
}