#!/bin/sh

#need the EPEL for erlang...
yum -y install epel-release

java_version=1.8.0

# yum install all the deps at once... starting from minimal here!
yum -y install java-${java_version}-openjdk-devel erlang maven mariadb-server wget

#Gross. Rabbitmq changes the zip type on some versions! 
# current release is 3.6.2, and it's xz, not gz! :( :( :(
# At least their directory structure seems stable, unlike SOME places.
#Set some variables... 
rabbit_mq_dir=/opt/rabbitmq_server
rabbit_mq_version=3.4.1
rabbit_mq_tar=rabbitmq-server-generic-unix-${rabbit_mq_version}.tar.gz

#wget the rabbitmq tar file :(
mkdir -p ${rabbit_mq_dir}
wget https://www.rabbitmq.com/releases/rabbitmq-server/v${rabbit_mq_version}/${rabbit_mq_tar} -P ${rabbit_mq_dir}
tar -C ${rabbit_mq_dir} -zxf ${rabbit_mq_dir}/${rabbit_mq_tar}
 
#leave files in nicer place for later & clean up empty dir! leave tar behind?
mv ${rabbit_mq_dir}/rabbitmq_server*/* ${rabbit_mq_dir}
rmdir ${rabbit_mq_dir}/rabbitmq_server*
