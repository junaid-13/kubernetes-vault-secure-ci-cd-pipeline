variable "aws_region" {
  description = "AWS region for deployment"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "devops-cluster"
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  default     = "1.21"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "Subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  default     = "t3.medium"
}
