# SETTING UP ANSIBLE IN CENTOS SERVER AND INSTALLING NGINX

# REEQUIREMENTS 
RHEL OR CENTOS release to be used
opensource Ansible package from www.ansible.com
multi
# SETUP AND CONFIGURATION:
sudo hostname Ansible-Master
sudo hostname Client1
exec bash
# become root
sudo su
yum update -y 
# setup epel repo because ansible package is not ansible in the epel repo on the master
yum install epel-release -y
# install ansible 
yum install ansible
ansible --version
# add ansible user to all the server  and same password
sudo  adduser ansible
# on all the servers 
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
 sudo vi /etc/ssh/sshd_config
 # uncomment the following line in above file
:/PasswordAuthentication :yes
PermitRootLogin
systemctl restart sshd
ssh ansible@18.119.136.231
# do the following  only on the master 
 sudo ssh-keygen -t rsa
 # the ssh you just generatted to the client 
 sudo ssh-copy-id ansible@
