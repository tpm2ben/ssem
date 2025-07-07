
provider "google" {
  project = "idp-play"
  region = "us-west1"
}

data "google_client_config" "default" {
}

locals {
  endpoint = "<where does this come from?>"
  cluster_ca_certificate        = “<>“
}

provider "kubernetes" {
  host                   = "https://${local.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = local.cluster_ca_certificate
}


resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "${var.name}"
  }
}
