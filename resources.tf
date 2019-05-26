resource "digitalocean_droplet" "test" {
  image  = "centos-7-x64"
  name   = "test-server"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [24516757]
}
