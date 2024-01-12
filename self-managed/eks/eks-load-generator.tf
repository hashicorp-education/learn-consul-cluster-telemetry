data "kubectl_path_documents" "docs" {
    pattern = "${path.module}/config/k6.yaml"
}

resource "kubectl_manifest" "consul_load_generator" {
    for_each  = toset(data.kubectl_path_documents.docs.documents)
    yaml_body = each.value

    depends_on = [helm_release.consul, helm_release.grafana]
}