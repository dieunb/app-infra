# Configure Kubernetes provider and connect to the Kubernetes API server
provider "kubernetes" {
  host = "https://localhost:6443"
  config_context_auth_info = "docker-desktop"
  config_context_cluster   = "docker-for-desktop"
}

# Create an Nginx pod
resource "kubernetes_pod" "nginx" {
  metadata {
    name = "terraform-example"
  }

  spec {
    container {
      image = "nginx:1.15.3"
      name  = "example"
    }
  }
}

# Create an service
resource "kubernetes_service" "nginx" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector {
      run = "${kubernetes_pod.nginx.metadata.0.labels.run}"
    }
    port {
      port = 80
    }

    type = "NodePort"
  }
}
