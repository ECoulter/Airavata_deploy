#/bin/sh
./Install_ansible.sh
source ${home}/ansible/hacking/env-setup
ansible-playbook pre_install.yml
ansible-playbook start_services.yml
ansible-playbook install_airavata.yml
ansible-playbook start_airavata.yml
