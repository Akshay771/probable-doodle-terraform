# resource "google_container_cluster" "my_cluster" {
#   name     = "my-gke-cluster"
#   location = "asia-south1-c"

#   node_pool {
#     name       = "default-pool"
#     node_count = 1

#     node_config {
#       machine_type = "e2-medium"
#       disk_size_gb = 20
#       image_type   = "COS_CONTAINERD"
#     }
#   }
#   deletion_protection = false
# }

resource "google_container_cluster" "primary" {
  name     = "terraform-cluster"
  location = "asia-south1-c"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

# attaching new nodepool
resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "asia-south1-c"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = 20
    image_type   = "COS_CONTAINERD"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    # oauth_scopes    = [
    #   "https://www.googleapis.com/auth/cloud-platform"
    # ]
  }
}

# New node pool you want to add
resource "google_container_node_pool" "new_pool" {
  name       = "new-node-pool"
  location   = "asia-south1-c"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    image_type   = "COS_CONTAINERD"
  }
}