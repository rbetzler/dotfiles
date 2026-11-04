group "default" {
  targets = ["omp"]
}

variable "HOME" {
  default = "$HOME"
}

target "omp" {
  context = "${HOME}/.builds/omp/"
  contexts = {
    # Arch specific
    certs = "/etc/ca-certificates/trust-source/anchors/"
    omp = "${HOME}/.omp/"
  }
  dockerfile = "Dockerfile"
  tags = ["omp:latest"]
}
