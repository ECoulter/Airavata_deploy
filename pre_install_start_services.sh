#!/bin/sh

#rabbitmq
/opt/rabbitmq_server/sbin/rabbitmq-server start -detached

systemctl start mariadb
