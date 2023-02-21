# geralex_infra
geralex Infra repository

Способ подключения в одну строку с локального терминала:

Способ первый: ssh -o ProxyCommand="ssh -W 10.128.0.16:22 62.84.127.205" someinternalhost
Способ второй: ssh -J geralex@62.84.127.205:22 10.128.0.16

Дополнительное задание:

создать alias:

cd ~/.ssh
nano config

Добавить следующие строки:

Host bastion
  HostName 62.84.127.205
  User geralex
  IdentityFile ~/.ssh/geralex

Host someinternalhost
  HostName 10.128.0.16
  ProxyJump bastion

Выполнить команду из локального терминала:

ssh someinternalhost



Адреса ВМ:
bastion_IP = 51.250.94.110
someinternalhost_IP = 10.128.0.16

Дополнительное задание:

URL: https://51-250-94-110.sslip.io