
output "Public ip" {
  value            = "${digitalocean_droplet.test.ipv4_address}"
  description      = "The Public IP of the Server"

  depends_on = ["digitalocean_droplet.test"]
}
