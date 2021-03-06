#!/bin/sh
# disable selinux - for now :( 
#hostnamectl ansiblehost.localdomain
echo -e "Please make sure to disble selinux (ONLY FOR TESTING!)\n " 
echo -e "Also make sure to set your network interfaces onboot=yes! \n"
echo -e "If you are doing this in VirtualBox, make sure to set hostname! \n"

yum -y install epel-release
yum -y install python-devel python-pip python-yaml python-jinja2 gcc libffi-devel openssl-devel
#pexpect has to be 3.3 because new 4.01 version only
# works with python >= 2.7 :(
pip install paramiko httplib2 six pexpect==3.3
#moved this after lib installations
git clone git://github.com/ansible/ansible.git --recursive ${HOME}/ansible
source ${HOME}/ansible/hacking/env-setup -q
echo -e "\nsource ./ansible/hacking/env-setup -q \n export MAVEN_OPTS=i\"-Xmx512Mi\"" >> ${HOME}.bashrc
echo "# Ansible Inventory" > inventory
echo "[headnode]" >> inventory
echo "localhost ansible_connection=local" >> inventory
mkdir -p /etc/ansible

mv inventory /etc/ansible/hosts
echo -e "[defaults]" > /etc/ansible/ansible.cfg
echo "retry_files_enabled = False # Do not create them" >> /etc/ansible/ansible.cfg
${HOME}/ansible/bin/ansible headnode -a "/bin/hostname"

