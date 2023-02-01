provider "kubernetes" {
  config = local.kubernetes_config
}

locals {
  kubernetes_config = <<EOF
apiVersion: v1
kind: Config
clusters:
- cluster:
    server: <cluster_url>
  name: <cluster_name>
contexts:
- context:
    cluster: <cluster_name>
    user: <user_name>
  name: <context_name>
current-context: <context_name>
users:
- name: <user_name>
  user:
    client-certificate-data: <client_certificate>
    client-key-data: <client_key>
EOF
}

module "promtail" {
  source = "grafana/promtail/kubernetes"
  version = "1.2.0"
  chart = "promtail"
  chart_repo = "https://grafana.github.io/helm-charts"
  values = {
    loki = {
      serviceName = "loki-ingester"
    }
  }
  provider = kubernetes
}

module "grafana" {
  source = "grafana/grafana/kubernetes"
  version = "9.0.0"
  chart = "grafana"
  chart_repo = "https://grafana.github.io/helm-charts"
  values = {
    persistence = {
      enabled = true
    }
  }
  provider = kubernetes
}

module "loki" {
  source = "grafana/loki/kubernetes"
  version = "3.0.0"
  chart = "loki-distributed"
  chart_repo = "https://grafana.github.io/helm-charts"
  values = {
    fullnameOverride = "loki"
  }
  provider = kubernetes
}