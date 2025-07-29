resource "helm_release" "argocd" {
<<<<<<< HEAD
  name             = "argocd"
  namespace        = var.namespace
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "5.46.8"
  create_namespace = true

  values = [
    templatefile("${path.module}/values.yaml", {
      hostname        = var.hostname
      admin_password  = var.admin_password_bcrypt
=======
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
>>>>>>> c4b68d66763e7a055b833a6708ed193cd3f73e87
    })
  ]
}
