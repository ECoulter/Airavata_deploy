#!/bin/bash
#
# Use this script to create databases if using mysql or mariadb. It assumes you have this
# database up and running. You execute this script on the same machine as the DB.
# Assumes that these are executed by a privileged user.

#Set up app catalog
mysql -e 'create database app_catalog;'
sudo mysql -e 'grant all privileges on app_catalog.* to "airavata'@'%" identified by "airavata";'

#Set up experiment catalog
mysql -e 'create database experiment_catalog;'
sudo mysql -e 'grant all privileges on experiment_catalog.*to "airavata'@'%" identified by "airavata";'

#Set up data catalo
mysql -e 'create database data_catalog;'
sudo mysql -e 'grant all privileges on data_catalog.* to "airavata'@'%" identified by "airavata";'

#Set up credential store
mysql -e 'create database credential_store;'
sudo mysql -e 'grant all privileges on credential_store.* to "airavata'@'%" identified by "airavata";'

#Set up workflow catalog
mysql -e 'create database workflow_catalog;'
sudo mysql -e 'grant all privileges on workflow_catalog.* to "airavata'@'%" identified by "airavata";'
