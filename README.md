# geralex_infra
geralex Infra repository

## ДЗ по ansible-4

- Доработка ролей для провижининга в Vagrant
- Тестирование ролей при помощи Molecule и Testinfra
- Переключение сбора образов пакером на использование ролей


## ДЗ по ansible-3

В рамках данного ДЗ выполнено:
- Перенесли созданные плейбуки в раздельные роли
- Описали два окружения (stage и prod)
- Использовали коммьюнити роль nginx
- Использовали Ansible Vault для наших окружений

## ДЗ по ansible-2

В рамках данного ДЗ выполнено:
- Используем плейбуки, хендлеры и шаблоны для конфигурации окружения и деплоя тестового приложения.
- Изменили провижн образов Packer на Ansible-плейбуки

## ДЗ по ansible-1

В рамках данного ДЗ выполнено:
- Установка Ansible
- Знакомство с базовыми функциями и инвентори
- Выполнение различных модулей на подготовленной в прошлых ДЗ инфраструктуре (Небольшой минус из прошлого дз у меня уже есть в образе скаченный проект из гита, поэтому часть блокировок можн словить на первом шаге, разумеется не актуально для тех, кто не выполняет задания со *)
- Написали простой плейбук

Ответ на реакцию команды:
ansible app -m command -a 'rm -rf ~/reddit' -- произошли изменения, так как мы выполнили команду удаления файлов


## ДЗ по terraform-2

В рамках данного дз за счет функционала модулей мы разнесли разворачивание инфраструктуры на два контура: stage и prod
Дополнительно мы разделили создание отдельных вм в качестве сервера БД и сервера приложения.

В рамках выполнения дополнительного задания, необходимо создать сервисный аккаунт и получить его ключи доступа:
https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-state-storage

Добавить в backend.tf создание нового ресурса в хранилище используя наши ключи.
Выполнить команды:
terraform init
terraform apply

Для того, чтобы в хранилище зафиксировать наше состояние добавляем в main.tf информацию по хранению нашего state и выполняем команду terraform init в рамках данной команды будет предложено загружить в хранилище текущее состояние.

Перенеся проект в отдельный каталог, с отсусттвующими локальными файлами состояний, выполняем команды
terraform init
terraform apply

Происходит актуализация состояния:
yandex_storage_bucket.state: Refreshing state... [id=terraform-2-otus-demo-storage-bucket]
module.db.yandex_compute_instance.db: Refreshing state... [id=****]
module.app.yandex_compute_instance.app: Refreshing state... [id=****]

ps Возможно,что-то не так настроено, но использование удаленного хранилища в части управления инфраструктурой происходит намного медленнее, чем хранить state локально =)

Дополнительно добавлены провижины для разворачивания приложения на инстансе app с использованием БД на инстанте db.


## ДЗ по terraform-1

1) Описано в виде кода разворачивание n-инстансов (задается в виде входного параметра) с установкой прилоежния puma-webservice
2) Описано в виде кода создание сетевого балансировщика с целевыми группами, куда входят ранее созданные инстансы с приложением
3) выполнено формитирование файлов проекта с помощью команды terraform fmt

4) После выполнения команды terraform apply в качестве выходных параметров получим ip-адреса серверов с приложением, а также ip-адрес балансировщика.

Доступ к приложению осуществляется по стандартному порту 80, балансировщик перенаправляет запросы на порт 9292 серверов приложений.

Пример выходных парамеров:

Outputs:

external_ip_address_app = [
  "51.250.67.3",
  "158.160.34.12",
]
lb_ip_address = tolist([
  "51.250.43.71",
])

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
