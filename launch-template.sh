#!/bin/bash
sudo apt update -y
sudo apt install mysql-client-core-5.7
sudo apt-get install apache2 -y
sudo apt-get install php libapache2-mod-php php-mysql -y
sudo apt-get -y install nfs-common
sudo mkdir -p /var/www/html 
#sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-6ec9ae9f.efs.eu-west-2.amazonaws.com:/ /var/www/html

