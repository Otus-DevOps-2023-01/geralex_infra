# geralex_infra
geralex Infra repository

## ДЗ по packer

1) Созданы два конфигурационных файла ubuntu16.json и immutable.json для создания двух образов диска.
Первый образ базовый, создает ВМ с Убунту версии 16.04 и установленными ruby и mongodb
Второй образ полный, создает ВМ с Убунту версии 16.04, установленными ruby и mongodb, а так же http-сервисом puma доступному по порту 9292
2) Предварительно необходимо скоррет=ктировать файл с параметрами variables.json, указав путь до файла содержащего данные сервисного аккаунта Яндекс.Облака, идентификатор folder-id.
3) Для создания базового образа выполните команду - packer build -var-file="./variables.json" ./ubuntu16.json
Для создания полного образа выполните команду - packer build -var-file="./variables.json" ./immutable.json
4) В рамках выполнения дополнительного задания был создан полный образ с возможностью сздания готовой ВМ с установленным и запущенным Puma.service.
Команда для создания образа доступна в файле create-reddit-vm.sh

## Способ подключения в одну строку с локального терминала:

Способ первый: ssh -o ProxyCommand="ssh -W 10.128.0.16:22 84.201.129.240" someinternalhost
Способ второй: ssh -J geralex@84.201.129.240:22 10.128.0.16

## Дополнительное задание:

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

## Как проверить работоспособность:

Выполнить команду из локального терминала:
ssh someinternalhost

Адреса виртуальных машин:
bastion_IP = 84.201.129.240
someinternalhost_IP = 10.128.0.16

Дополнительное задание:
URL: https://84.201.129.240.sslip.io/


testapp_IP = 158.160.44.236
testapp_port = 9292
