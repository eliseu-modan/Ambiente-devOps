#/bin/bash

### install jenkins ,WGET java 11

yum install epel-release -y
yum install wget -y
sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install java-11-openjdk-devel -y
yum install jenkins -y
systemctl daemon-reload

##instalação do docker e docker-compose
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl daemon-reload

# usermod -aG docker jenkins
# sudo wget -O /etc/yum.repos.d/jenkins.repo \
#     https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# sudo dnf upgrade
# # Add required dependencies for the jenkins package
# sudo dnf install fontconfig java-17-openjdk
# sudo dnf install jenkins
# sudo systemctl daemon-reload

#instalar sonar scanner
# yum install wget unzip -y
# wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
# unzip sonar-scanner-cli-4.6.2.2472-linux.zip -d /opt/
# mv /opt/sonar-scanner-cli-4.6.2.2472 /opt/sonar-scanner
# chown -R jenkins:jenkins /opt/sonar-scanner
# echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
# curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
# sudo yum install nodejs -y

# GITHUB_REPO="eliseu-modan/projetoTask.git"
# DESTINATION="/app"  
# sudo yum update
# sudo yum install -y git
# git clone "https://github.com/$GITHUB_REPO" "$DESTINATION"
# cd "$DESTINATION"
# echo "Projeto clonado e configurado com sucesso!"
