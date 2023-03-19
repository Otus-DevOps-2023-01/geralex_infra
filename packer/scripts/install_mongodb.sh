#!/bin/bash

apt update
apt install mongodb -y

systemctl start mongodb
systemctl enable mongodb
