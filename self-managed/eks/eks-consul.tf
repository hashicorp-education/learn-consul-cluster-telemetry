# Create consul namespace
resource "kubernetes_namespace" "consul" {
  metadata {
    name = "consul"
  }
}

# Create Consul deployment
resource "helm_release" "consul" {
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  version    = var.consul_chart_version
  chart      = "consul"
  namespace  = "consul"
  wait       = false

  values = [
    templatefile("${path.module}/helm/consul-v1.yaml",{
      consul_version = var.consul_version
    })
  ]

  depends_on = [module.eks,
                module.eks.eks_managed_node_groups,
                kubernetes_namespace.consul,
                module.eks.aws_eks_addon,
                module.vpc
                ]
}