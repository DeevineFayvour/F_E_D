output "eks_cluster_name" {
  value = aws_eks_cluster.demo.name
}

output "eks_cluster_url" {
  value = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}