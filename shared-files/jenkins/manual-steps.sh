#!/bin/bash

################## Jenkins Host ##################

echo "* Set password for the jenkins user ..."
passwd jenkins

echo "* Generate SSH public and private key for the jenkins user ..."
ssh-keygen -b 2048 -t rsa -m PEM -f /var/lib/jenkins/.ssh/id_rsa -N ""
chown -R jenkins: /var/lib/jenkins/.ssh

echo "* Export the key pair in a file ..."
cp /var/lib/jenkins/.ssh/* /shared/jenkins-keys/

Create credentials from file for the jenkins user by using the rsa private key (/var/lib/jenkins/.ssh/id_rsa)
Refference - https://www.jenkins.io/doc/book/using/using-credentials/

###################################################



################## Other Hosts ##################

echo "* Create jenkins user and give him sudo permissions ..."
useradd -Um -s /bin/bash jenkins
echo "jenkins ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/jenkins

echo "* Add the jenkins user to the docker group"
usermod -aG docker jenkins

echo "* Copy the jenkins public key on the host ..."
cp /shared/jenkins-keys/id_rsa.pub /home/jenkins/.ssh/authorized_keys

###################################################



################## Adding Nodes ##################

Execute the following script by passing it the node name, credential ID, and label - /shared-files/jenkins/add-jenkins-slave.sh

Example:
/shared-files/jenkins/add-jenkins-slave.sh docker.do1.lab jenkins docker

###################################################