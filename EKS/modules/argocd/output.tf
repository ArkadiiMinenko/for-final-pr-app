output "argocd_admin_password" {
  value       = base64decode(data.kubernetes_secret.argocd_secret.data["admin.password"])
  sensitive   = true
  description = "Admin password for ArgoCD"
}

output "argocd_url" {
  value       = "https://${data.kubernetes_ingress_v1.argocd_ingress.status[0].load_balancer[0].ingress[0].hostname}"
  description = "External URL of ArgoCD"
}
