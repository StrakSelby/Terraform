terraform {
  required_version = "1.9.8"

  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_droplet" "server" {
  image     = "ubuntu-22-04-x64"
  name      = "server"
  region    = "sgp1"
  size      = "s-1vcpu-1gb"
}