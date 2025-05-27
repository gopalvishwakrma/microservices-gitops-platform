output "cluster_endpoint" {
     description = "Endpoint for EKS control plane"
     value       = module.eks.cluster_endpoint
   }

   output "cluster_name" {
     description = "Name of the EKS cluster"
     value       = var.cluster_name
   }