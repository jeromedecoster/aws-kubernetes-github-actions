module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = var.project_name
  cluster_version = "1.21"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # cluster_endpoint_private_access = true
  # cluster_endpoint_public_access  = true

  eks_managed_node_group_defaults = {
    disk_size      = 8
    instance_types = ["t2.medium"]
  }

  eks_managed_node_groups = {
    worker-group-1 = {
      # min_size     = 1
      # max_size     = 2
      desired_size = 1

      instance_types                = ["t2.small"]
      capacity_type                 = "ON_DEMAND" # SPOT
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    }

    worker-group-2 = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types                = ["t2.medium"]
      capacity_type                 = "ON_DEMAND" # SPOT
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
    }
  }
}