# Configure Kubernetes provider and connect to the Kubernetes API server
provider "kubernetes" {
  config_context_cluster   = "docker-desktop"
}

# Create a deployment
resource "kubernetes_deployment" "web-server" {
  metadata {
    name = "web-server"
    labels {
      name = "nginx"
    }
  }

  spec {
    replicas = 0
    selector {
      match_labels = {
        name = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          name = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:1.15.3"
          name  = "nginx"
        }
      }
    }
  }
}

# Create an service
resource "kubernetes_service" "nginx" {
  metadata {
    name = "web-server"
  }
  spec {
    selector {
      name = "${kubernetes_deployment.web-server.metadata.0.labels.name}"
    }
    port {
      port = 8888
    }

    type = "NodePort"
  }
}
