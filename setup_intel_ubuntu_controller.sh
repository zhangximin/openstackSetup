#!/bin/bash

sudo apt-get install -y git sudo

sudo -u root sh -c "echo \"simon ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers"

sudo groupadd stack

sudo useradd -g stack -s /bin/bash -d /opt/stack -m stack

sudo -u root sh -c "echo \"stack ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers"

sudo mkdir -p /opt/stack/.ssh

sudo cp ./authorized_keys /opt/stack/.ssh/

sudo -u stack sh -c "git clone https://git.openstack.org/openstack-dev/devstack /opt/stack/devstack"

sudo cp ./controller/local.conf ./controller/local.sh /opt/stack/devstack

sudo chown -R stack.stack /opt/stack/
sudo -u stack sh -c "chmod -R 700 /opt/stack/.ssh"

sudo -u stack -H sh -c "cd ~/devstack;./stack.sh"


