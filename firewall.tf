resource "google_compute_firewall" "allow_webhook_Jenkins" {

  allow {
    ports    = ["8080"]
    protocol = "tcp"
  }


  description   = "Allow Jenkins access"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "allow-webhook-jenkins"
  network       = "https://www.googleapis.com/compute/v1/projects/pf-production/global/networks/altanet"
  priority      = "1000"
  project       = local.project
  source_ranges = ["10.20.0.0/14"]
  source_tags   = []
  target_tags   = ["fw-jenkins"]
}

resource "google_compute_firewall" "airflow_ipip" {

  allow {
    ports    = []
    protocol = "ipip"
  }


  description   = ""
  direction     = "INGRESS"
  disabled      = "false"
  name          = "airflow-ipip"
  network       = "https://www.googleapis.com/compute/v1/projects/pf-production/global/networks/altanet"
  priority      = "1000"
  project       = local.project
  source_ranges = ["10.0.0.0/8"]
  source_tags   = []
  target_tags   = []
}

