module "ecr" {
  source                 = "registry.terraform.io/cloudposse/ecr/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  for_each               = toset(var.applications_names)
  namespace              = "k8s"
  stage                  = var.env_name
  name                   = each.key
  principals_full_access = aws_iam_role.this.arn
  tags                   = var.tags
}