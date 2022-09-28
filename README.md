English version [below](#english-version).
###  Запуск [mhddos_proxy_releases](https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases) на віртуальній машині в хмарному сервісі GCP з нуля
Ідентичний проєкт для хмарного сервісу AWS знаходиться [тут](https://github.com/mqstr/itarmy-aws).
#### Швидкий старт
    $ git clone https://github.com/mqstr/itarmy-gcp.git
    $ cd itarmy-gcp
    $ terraform init
    $ terraform apply
Можливо вам доведеться запустити `terraform apply` двічі, оскільки для розгортання Compute Engine API потрібно кілька хвилин.
#### Опис
Цей проєкт використовує мінімальну конфігурацію ресурсів - збільшить їх за потреби:
- тип віртуальної машини `e2-micro` в хмарі GCP
- `1000` потоків у mhddos_proxy_linux
- вимкнення віртуальної машини о `19:00`
#### Підключення до віртуальної машини
1. Згенеруйте ключі SSH на локальному комп’ютері
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
2. Запустіть `terraform apply` щоб завантажити публічний ключ SSH в хмару GCP
3. Підключіться до віртуальної машини
```
$ ssh ubuntu@<External IP>
```
4. Приєднайтеся до сеансу `tmux` з назвою `itarmy`
```
ubuntu@itarmy:~$ tmux attach-session -t itarmy
```
## English version
###  Running [mhddos_proxy_releases](https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases) on VM instance in the GCP cloud from scratch
An identical project for the AWS cloud is [here](https://github.com/mqstr/itarmy-aws).
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
#### Connect to the VM instance
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
2. Run `terraform apply` to upload public SSH key to the GCP cloud
3. Connect to the VM instance
```
$ ssh ubuntu@<External IP>
```
4. Attach to a `tmux` session with the name `itarmy`
```
ubuntu@itarmy:~$ tmux attach-session -t itarmy
```
