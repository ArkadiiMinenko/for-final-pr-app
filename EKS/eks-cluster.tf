resource "aws_eks_cluster" "danit" {
  name     = var.name
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.danit-cluster.id]
    subnet_ids         = var.subnets_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.kubeedge-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.kubeedge-cluster-AmazonEKSVPCResourceController,
  ]

  tags = merge(var.tags, {
    Name = var.name
  })
}

data "aws_eks_cluster_auth" "danit" {
  name = aws_eks_cluster.danit.name
}

resource "aws_eks_addon" "coredns" {
  cluster_name    = var.name
  addon_name      = "coredns"
  addon_version   = "v1.12.2-eksbuild.4"
  depends_on      = [aws_eks_node_group.danit-amd]
}

module "argocd" {
  source             = "./modules/argocd"
  hostname           = "argocd.${var.name}.${var.group}.test-danit.com"
  namespace          = "argocd"
  helm_release_name  = "argocd"
  region             = var.region
  name               = var.name
  group              = var.group
}