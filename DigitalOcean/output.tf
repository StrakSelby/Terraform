output "ip_address" {
  value       = digitalocean_droplet.server.ipv4_address
  description = "The public IP address of the Server"
}