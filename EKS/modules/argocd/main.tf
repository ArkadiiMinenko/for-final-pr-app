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

data "kubernetes_secret" "argocd_secret" {
  metadata {
    name      = "argocd-secret"
    namespace = var.namespace
  }

  depends_on = [helm_release.argocd]
}

data "kubernetes_ingress_v1" "argocd_ingress" {
  metadata {
    name      = "argocd-server"
    namespace = var.namespace
  }

  depends_on = [helm_release.argocd]
}

resource "null_resource" "apply_argocd_app" {
  depends_on = [helm_release.argocd]

  provisioner "local-exec" {
    command = "kubectl apply -f ${path.module}/app.yaml"
  }
}

resource "null_resource" "update_kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.region} --name ${var.name}"
  }
}
