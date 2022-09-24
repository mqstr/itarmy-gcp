###  Running [mhddos_proxy_releases](https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases) on VM instance in the GCP cloud from scratch
#### Quick start
    $ git clone https://github.com/mqstr/itarmy-gcp.git
    $ cd itarmy-gcp
    $ terraform init
    $ terraform apply
You may need to run `terraform apply` twice since Compute Engine API needs a few minutes to propagate Enable action.
#### Description
This project uses minimal resource configuration - enlarge them if needed:
- machine type `e2-micro` in GCP
- `1000` threads in mhddos_proxy_linux
- power off the VM instance at `19:00`
#### Connect to VM instance
1. Generate SSH keys on your local mashine
```
$ ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/master/.ssh/id_ed25519):
Created directory '/home/master/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/master/.ssh/id_ed25519
Your public key has been saved in /home/master/.ssh/id_ed25519.pub
```
2. Run `terraform apply` to upload public SSH key to GCP cloud
3. Connect to VM instance
```
$ ssh ubuntu@<External IP>
```
4. Attach to a `tmux` session with the name `itarmy`
```
ubuntu@itarmy:~$ tmux attach-session -t itarmy
```
