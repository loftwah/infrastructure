terraform {
  required_providers {
    civo = {
      source = "civo/civo"
      version = "1.0.19"
    }
  }
}

provider "civo" {
  token = "token"
}