terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# Create VM for CICD testing and deploying web app onto later
resource "digitalocean_droplet" "runner" {
  image  = "ubuntu-22-10-x64"
  name   = "runner.dnsif.ca"
  region = "syd1"
  size   = "s-1vcpu-2gb-amd"
  #size   = "s-2vcpu-4gb-amd"
  ssh_keys = [ 38147259, 37150778 ]

}

output "droplet_ip_address" {
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "runner" {
  domain = "dnsif.ca"
  type   = "A"
  name   = "runner"
  ttl = 600
  value  = digitalocean_droplet.web.ipv4_address
}