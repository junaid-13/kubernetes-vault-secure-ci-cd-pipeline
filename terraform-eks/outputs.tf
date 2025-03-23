output "cluster_id"{
    value = aws_eks_cluster.eks_cluster.id
}

output "cluster_id_2" {
    value = aws_eks_cluster.eks_cluster.id
}

output "kubeconfig_command" {
    value = "aws eks update-kubeconfig --name ${aws_eks_cluster.eks_cluster.name} --region us-east-1"
}