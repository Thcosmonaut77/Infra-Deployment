#!/bin/bash
set -e

echo "===== Updating system packages ====="
sudo apt-get update -y
sudo apt-get upgrade -y

echo "===== Installing java ====="
sudo apt-get install -y openjdk-21-jdk

echo "===== Adding Jenkins repository and GPG key ====="
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "===== Updating package list and installing Jenkins ====="
sudo apt-get update -y
sudo apt-get install -y jenkins

echo "===== Installing Maven build tool ====="
sudo apt-get install -y maven

echo "===== Enabling and starting Jenkins ====="
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install dependencies
sudo apt-get install -y wget gnupg software-properties-common unzip

echo "===== Installing Terraform 1.13.0 ====="
cd /tmp
wget https://releases.hashicorp.com/terraform/1.13.0/terraform_1.13.0_linux_amd64.zip
unzip terraform_1.13.0_linux_amd64.zip
sudo mv terraform /usr/local/bin/
sudo chmod +x /usr/local/bin/terraform

sleep 5

# Verify installation
terraform -version

echo "===== Jenkins installation complete ====="
echo "Initial Jenkins admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
