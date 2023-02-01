metadata {
  path = "ingress-nginx"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:WE8kaCRUOJuedZHC/DGqIPHyJn6OcCKQxiZT8QbnqdE="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:WE8kaCRUOJuedZHC/DGqIPHyJn6OcCKQxiZT8QbnqdE="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "ingress-nginx",
  ]

  sha     = "h1:WE8kaCRUOJuedZHC/DGqIPHyJn6OcCKQxiZT8QbnqdE="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "71609f10a6b1cfb90e387d3d13ca4d9bb0907613466d4749136173284421cb43"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "ingress-nginx",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "ingress-nginx",
  ]

  sha     = "h1:2jOVJlp82JQFixKBj+U+4J4liY1eoGTOS0/Zwsr2RK0="
  retries = 1
  verbose = false
}
