# geralex_infra
geralex Infra repository

Способ подключения в одну строку с локального терминала:

Способ первый: ssh -o ProxyCommand="ssh -W 10.128.0.16:22 84.201.129.240" someinternalhost
Способ второй: ssh -J geralex@84.201.129.240:22 10.128.0.16

Дополнительное задание:

создать alias:

cd ~/.ssh
nano config

Добавить следующие строки:

Host bastion
  HostName 84.201.129.240
  User geralex
  IdentityFile ~/.ssh/geralex

Host someinternalhost
  HostName 10.128.0.16
  ProxyJump bastion

Выполнить команду из локального терминала:

ssh someinternalhost

Адреса виртуальных машин:
bastion_IP = 84.201.129.240
someinternalhost_IP = 10.128.0.16

Дополнительное задание:

URL: https://84.201.129.240.sslip.io/