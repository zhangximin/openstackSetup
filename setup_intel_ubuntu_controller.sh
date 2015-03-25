

apt-get install -y git sudo

groupadd stack

useradd -g stack -s /bin/bash -d /opt/stack -m stack

sudo echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

mkdir ~/.ssh; chmod 700 ~/.ssh

cp ./authorized_keys ~/.ssh

git clone https://git.openstack.org/openstack-dev/devstack

cp ./controller/local.conf ./controller/local.sh ./devstack

cd devstack

./stack.sh


