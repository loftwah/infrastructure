resource "civo_kubernetes_cluster" "cluster" {
  name              = "<name you want to give your cluster>"
  applications      = ""
  num_target_nodes  = 3
  target_nodes_size = element(data.civo_instances_size.small.sizes, 0).name
  region            = "NYC1"
}

data "civo_kubernetes_cluster" "cluster" {
  name = civo_kubernetes_cluster.cluster.name
}

data "civo_instances_size" "small" {
    filter {
        key = "type"
        values = ["kubernetes"]
    }
}