output "vm_public_ip" {
  value = "${digitalocean_droplet.main.ipv4_address}"
}