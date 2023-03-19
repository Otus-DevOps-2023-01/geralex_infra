#!/bin/bash

mv puma.service ../../etc/systemd/system/

#запускаем демона
systemctl daemon-reload
systemctl enable puma.service
systemctl restart puma.service
#проверим статус
systemctl status puma.service
