output "argocd_admin_password" {
  description = "Default admin password from argocd-secret"
  value = nonsensitive(
    base64decode(
      kubernetes_secret.argocd_secret.data["admin.password"]
    )
  )
}

output "argocd_url" {
  description = "ArgoCD external address"
  value = "https://${kubernetes_ingress_v1.argocd_server.status[0].load_balancer[0].ingress[0].hostname}"
}
