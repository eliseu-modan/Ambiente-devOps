!/usr/bin/bash
useradd sonar
yum install wget unzip java-11-openjdk-devel -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.1.0.47736.zip
unzip sonarqube-9.1.0.47736.zip -d /opt/
mv /opt/sonarqube-9.1.0.47736 /opt/sonarqube
chown -R sonar:sonar /opt/sonarqube
touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT
service sonar start

#instalar sonar scanner

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
unzip sonar-scanner-cli-4.6.2.2472-linux.zip -d /opt/
mv /opt/sonar-scanner-cli-4.6.2.2472-linux /opt/sonar-scanner
chown -R sonar:sonar /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y


# GITHUB_REPO="eliseu-modan/projetoTask.git"
# DESTINATION="/app"  
# sudo yum updatee
# sudo yum install -y git
# git clone "https://github.com/$GITHUB_REPO" "$DESTINATION"
# cd "$DESTINATION"
# echo "Projeto clonado e configurado com sucesso!"

# 6ad1ab35163decd3da71858794b444311b6f0fc0
# token task-ambience 4e3d1a6dfc9d3cee2f4d14e2c71260da930f261d