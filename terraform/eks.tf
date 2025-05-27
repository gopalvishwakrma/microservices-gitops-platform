module "eks" {
     source  = "terraform-aws-modules/eks/aws"
     version = "~> 18.0"

     cluster_name    = var.cluster_name
     cluster_version = "1.21"

     vpc_id     = module.vpc.vpc_id
     subnet_ids = module.vpc.private_subnets

     eks_managed_node_groups = {
       workers = {
         min_size     = 1
         max_size     = 5
         desired_size = 2

         instance_types = ["t3.medium"]
         capacity_type  = "ON_DEMAND"
       }
     }

     tags = {
       Terraform   = "true"
       Environment = "dev"
     }
   }

   resource "aws_eks_addon" "cni" {
     cluster_name = module.eks.cluster_id
     addon_name   = "vpc-cni"
   }

   resource "aws_eks_addon" "kube_proxy" {
     cluster_name = module.eks.cluster_id
     addon_name   = "kube-proxy"
   }