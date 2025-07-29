module "eks-external-dns" {
  #source                           = "lablabs/eks-external-dns/aws"
  source                           = "./modules/eks-external-dns"
  #version                          = "1.2.0"
  cluster_identity_oidc_issuer     = aws_eks_cluster.danit.identity.0.oidc.0.issuer
  cluster_identity_oidc_issuer_arn = module.oidc-provider-data.arn
  
  enabled                = true
  rbac_create            = true
  service_account_create = true

  irsa_role_create         = true
  irsa_policy_enabled      = true
  irsa_assume_role_enabled = false
}

