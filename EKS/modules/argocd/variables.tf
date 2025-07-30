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

variable "region" {
  description = "AWS region"
  type        = string
}

variable "name" {
  description = "EKS cluster name"
  type        = string
}

