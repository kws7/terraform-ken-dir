terraform {
  source = "../terraform"
}

locals {
  config = yamldecode(file("${path_relative_from_include()}/config.yaml"))
}

inputs = local.config

