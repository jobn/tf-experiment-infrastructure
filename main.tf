terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_cloud_run_service" "app" {
  name     = "app"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
        resources {
          limits = {
            memory = "128Mi"
            cpu    = "1"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "public" {
  location = google_cloud_run_service.app.location
  service  = google_cloud_run_service.app.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

