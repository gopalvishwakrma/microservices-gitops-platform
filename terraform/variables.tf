variable "aws_region" {
     description = "AWS region for resources"
     default     = "us-east-1"
   }

   variable "cluster_name" {
     description = "Name of the EKS cluster"
     default     = "microservices-gitops-cluster"
   }