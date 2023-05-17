# Create Droplet
resource "digitalocean_droplet" "nextcloud-vm" {
  image  = "ubuntu-22-04-x64"  # Image slug for the desired OS
  name   = "nextcloud-lab-iac"
  region = "syd1"              # Desired region
  size   = "s-2vcpu-4gb"       # Droplet size
  ssh_keys = [ 38147259, 37150778 ]
}

resource "digitalocean_record" "nextcloud" {
  domain = "dnsif.ca"
  type   = "A"
  name   = "nextcloud"
  ttl = 600
  value  = digitalocean_droplet.nextcloud-vm.ipv4_address
}