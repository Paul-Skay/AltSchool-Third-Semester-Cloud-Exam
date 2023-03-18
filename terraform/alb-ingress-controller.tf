resource "helm_release" "ingress-alb" {
  name       = "ingress-alb"
  chart      = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  version    = "1.4.6"

  set {
    name  = "autoDiscoverAwsRegion"
    value = "true"
  }
  set {
    name  = "autoDiscoverAwsVpcID"
    value = "true"
  }
  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  depends_on = [local_file.kubeconfig]
}

resource "aws_iam_policy" "worker_policy" {
  name        = "worker-policy-${var.cluster_name}"
  description = "Worker policy for the ALB Ingress"

  policy = file("alb-iam-policy.json")
}

resource "aws_iam_role_policy_attachment" "additional" {
  for_each = module.eks.eks_managed_node_groups

  policy_arn = aws_iam_policy.worker_policy.arn
  role       = each.value.iam_role_name
}

# resource "helm_release" "ingress-nginx" {
#   name = "ingress-nginx"
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   chart = "ingress-nginx"
#   namespace = "ingress"
#   version = "4.0.13"
#   create_namespace = true
#   timeout = 300

#   set {
#     name  = "cluster.enabled"
#     value = "true"
#   }

#   set {
#     name  = "metrics.enabled"
#     value = "true"
#   }

#   depends_on = [local_file.kubeconfig]  
# }