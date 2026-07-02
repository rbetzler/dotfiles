group "default" {
  targets = ["pi"]
}

variable "HOME" {
  default = "$HOME"
}

target "pi" {
  context = "${HOME}/.builds/pi/"
  contexts = {
    dracula = "${HOME}/repos/pi-coding-agent/"
    pi = "${HOME}/.pi/"
    superpowers = "${HOME}/repos/obra-superpowers/"
  }
  dockerfile = "Dockerfile"
  tags = ["pi:latest"]
}
