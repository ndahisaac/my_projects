
# STATIC INVENTORY USING : PASSWORDLESS AUTHENTICATION AND KEYBASE AUTHENTICATION
# Setting up Passwordsless Authentication/SSh Key Base Authentication  
 =====================================================================
 sudo useradd ansible
 passwd ansible
 # Vi into the following file and edit the following lines
 sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
 sudo vi /etc/ssh/sshd_config
:/PasswordAuthentication :yes
:/PermitRootLogin
x!
sudo systemctl sshd
# login as user ansible in a different terminal
ssh ansible@18.191.215.97
# add user ansible to the sudoer group in the other termial
usermod -aG wheel ansible
# vi into /etc/sudoers
sudo vi /etc/sudoers
%ansible ALL=(ALL) NOPASSWD: ALL

==================================
=================================

=====================================================================================================================================================
# DYNAMIC INVENTORY
#Setting up dynamic inventory  in ubuntu server 
# setting up ansible with one master and two worker-Nodes
#On Master run all commands a regular user
sudo hostnamectl set-hostname "server name"
exec bash

# update ubuntu
sudo apt update -y
# Check the version of your linux
uname -a 
# install ansible
sudo apt install -y ansible
# install python
sudo apt-get install python-is-python3 
sudo apt-get install python3-pip -y
# install boto 3 $ awscli is not required for the setup 
 pip3 install boto
 pip3 install boto3
 pip3 install awscli
# uncomment  sudo_user =root the ansible config file 
sudo cp  /etc/ansible/ansible.cfg  /etc/ansible/ansible.cfg.backup 
sudo vi /etc/ansible/ansible.cfg 
# vi into your key.pem and paste in the master
sudo vi "key.pem"
chmod 400 key.pem
#in case you ran the above commands a root run the following command 
chown ubuntu:uobuntu "key.pem"
#copy the below files :
aws s3 cp s3://code-sharing-bucket/jespo/ansible/ec2.py .
aws s3 cp s3://code-sharing-bucket/jespo/ansible/ec2.ini .
# Configure credential for the master server 
export AWS_ACCESS_KEY_ID='AKIAYSHKVTCPW7W73H3U'
export AWS_SECRET_ACCESS_KEY='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'

# Give both files executable permisssions
#github link
https://github.com/InsightDataScience/ansible-playbook/blob/master/ec2.ini
chmod +x ec2.ini
chmod +x ec2.py
# run the following command
ssh-agent bash
# add pem key to ubuntu home directory
ssh-add /home/ubuntu/key.pem
# export the followinig command 
export EC2_INI_PATH=/home/ubuntu/ec2.ini
export ANSIBLE_HOSTS=/home/ubuntu/ec2.py
# make sure you name your slaves as Clients
export EC2_INSTANCE_FILTERS='tag:Name=Client*'
# you the following script to scan your environment 
# the below command is required before the inventory can be collected
./ec2.py
# go into remote notes and create a file call demo.txt and the command is an ad-hoc command
ansible -m file -b -a "path=/home/ubuntu/demo2.txt state=touch" -i ec2.py ec2
#vi into  /etc/ansible/ansible.cfg and uncomment the following lines 
sudo vi /etc/ansible/ansible.cfg 
host_key_checking = False”
sudo_user
# the following command will update all the available clients -b (become)
ansible -m yum -b -a "name=ntp state=absent" -i ec2.py ec2




ansible -m apt -b -a "name=* state=latest" -i ec2.py ec2ansible -m file -b -a "path=/home/ubuntu/demo2.txt state=touch" -i ec2.py ec2ansible -m copy -b -a "src=/home/ubuntu/test1 dest=/home/ubuntu" -i ec2.py ec2ansible -m user -b -a "name=user1 state=present" -i ec2.py ec2ansible -m user -b -a "name=user1 state=present" -i ec2.py ec2ansible -m user -b -a "name=group1" -i ec2.py ec2ansible -m user -b -a "name=user1 group=group1" -i ec2.py ec2ansible -m user -b -a "name=ntp state=absent" -i ec2.py ec2ansible -m user -b -a "name=httpd state=absent" -i ec2.py ec2ansible -m user -b -a "name=httpd state=started" -i ec2.py ec2
==========================================================================================
DYNAMIC INVENTORY continuation 
===========================================================================================
# how will you create a customer user apart from ubuntu to work in this dynamic user?
answer:
-Bootstraping the user in the  Autoscaling launch configurations 
-Golden AMI
-system manager
#ANSIBLE AD-HOC COMMANDS 
ansible -m apt -b -a "name=* state=latest" -i ec2.py ec2ansible -m file -b -a "path=/home/ubuntu/demo2.txt state=touch" -i ec2.py ec2ansible -m copy -b -a "src=/home/ubuntu/test1 dest=/home/ubuntu" -i ec2.py ec2ansible -m user -b -a "name=user1 state=present" -i ec2.py ec2ansible -m user -b -a "name=user1 state=present" -i ec2.py ec2ansible -m user -b -a "name=group1" -i ec2.py ec2ansible -m user -b -a "name=user1 group=group1" -i ec2.py ec2ansible -m user -b -a "name=ntp state=absent" -i ec2.py ec2ansible -m user -b -a "name=httpd state=absent" -i ec2.py ec2ansible -m user -b -a "name=httpd state=started" -i ec2.py ec2
ansible -m apt -b -a "name=* state=latest" -i ec2.py ec2
ansible -m user -b -a "name=user1 state=present" -i ec2.py ec2

#ANSIBLE PLAYBOOKS
wget https://jjtech-demo-test.s3-us-west-2.amazonaws.com/install-apache2.yml
# command to run a playbook ec2.py to execute, ec2(group) -i(inventory), playbook name
ansible-playbook -i ec2.py -l ec2 install-apache2.yml --check
=========================================================================================
=========================================================================================




