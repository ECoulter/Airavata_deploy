#!/bin/bash
#
# Setup RabbitMQ user, vhost and permissions. This script must be run by a
# privileged user.
#
echo "Setting up RabbitMQ user, vhosts and permissions"
sudo rabbitmqctl add_user airavata airavata
sudo rabbitmqctl add_vhost messaging
sudo rabbitmqctl set_permissions -p messaging airavata "." "." ".*"
