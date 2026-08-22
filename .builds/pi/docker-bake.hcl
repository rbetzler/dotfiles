group "default" {
  targets = ["pi"]
}

variable "HOME" {
  default = "$HOME"
}

target "pi" {
  context = "${HOME}/.builds/pi/"
  contexts = {
    # Arch specific
    certs = "/etc/ca-certificates/trust-source/anchors/"
    pi = "${HOME}/.pi/"
  }
  dockerfile = "Dockerfile"
  tags = ["pi:latest"]
}
