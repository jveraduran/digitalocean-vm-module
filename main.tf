terraform {
  required_version = ">= 0.12"
}

data "digitalocean_image" "main" {
  name = "${var.image}"
}
resource "digitalocean_ssh_key" "main" {
  name       = "${var.name-suffix}-${var.environment}"
  public_key = "${var.ssh-key}"
}
resource "digitalocean_droplet" "main" {
  image     = "${data.digitalocean_image.main.id}"
  name      = "${var.name-suffix}-${var.environment}"
  region    = "${var.regions}"
  size      = "${var.size}"
  ssh_keys  = ["${digitalocean_ssh_key.main.fingerprint}"]
}