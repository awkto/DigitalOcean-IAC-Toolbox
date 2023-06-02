# Create Droplet
resource "digitalocean_droplet" "debian11" {
  image  = "debian-11-x64"  # Image slug for the desired OS
  name   = "debian11-generic"
  region = "syd1"              # Desired region
  size   = "s-1vcpu-2gb"       # Droplet size
  ssh_keys = [ 38147259, 37150778 ]
}

resource "digitalocean_record" "debian11-dns" {
  domain = "dnsif.ca"
  type   = "A"
  name   = "debian11"
  ttl = 600
  value  = digitalocean_droplet.debian11.ipv4_address
}
