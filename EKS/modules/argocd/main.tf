resource "helm_release" "argocd" {
  name             = var.helm_release_name
  namespace        = var.namespace
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "5.46.8"
  create_namespace = true

  values = [
    templatefile("${path.module}/values.yaml", {
      hostname = var.hostname
    })
  ]
}

resource "null_resource" "argocd_app" {
  depends_on = [helm_release.argocd]

  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/app.yaml -n argocd"
  }
}