resource "helm_release" "argocd" {
  name             = var.helm_release_name
  namespace        = var.namespace
  create_namespace = true

  force_update = true
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.46.8"

  values = [
    templatefile("${path.module}/values.yaml", {
      hostname = var.hostname
    })
  ]
}
