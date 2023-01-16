#!/bin/bash

echo "* Update repositories and install Java"
apt-get update -y
apt-get install -y fontconfig openjdk-11-jre groovy git curl

echo "* Add and import the repository key"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "* Update repositories and install Jenkins"
apt-get update -y && apt-get install -y jenkins
