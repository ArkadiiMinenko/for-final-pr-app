variable "namespace" {
  description = "Namespace where ArgoCD will be deployed"
  type        = string
  default     = "argocd"
}

variable "helm_release_name" {
  description = "Helm release name for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "hostname" {
  description = "DNS hostname for ArgoCD ingress"
  type        = string
}

variable "hostname" {
  description = "DNS hostname for ArgoCD"
  type        = string
}

variable "admin_password_bcrypt" {
  description = "хеш пароля для ArgoCD admin"
  type        = string
}
