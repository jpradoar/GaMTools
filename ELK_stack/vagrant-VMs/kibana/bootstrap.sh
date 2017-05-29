#!/bin/bash
############################
# Testing on: ubuntu-trusty-64 3.13.0-117-generic
############################

apt-get update
apt-get upgrade -y 
apt-get install vim wget net-tools mlocate strace nmap telnet ansible git -y

wget https://artifacts.elastic.co/downloads/kibana/kibana-5.3.2-amd64.deb -O /tmp/kibana-5.3.2-amd64.deb

add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install openjdk-8-jdk -y

dpkg --install /tmp/kibana-5.3.2-amd64.deb


sed -i 's/#server.host: "localhost"/server.host: 0.0.0.0/g' /etc/kibana/kibana.yml
sed -i 's/#server.name: "your-hostname"/server.name: "kibana"/g' /etc/kibana/kibana.yml
# elasticsearch.url: "http://IP_del_elasticsearch:9200"
echo "elasticsearch.url: 'http://99.99.99.101:9200' ">>/etc/kibana/kibana.yml


/etc/init.d/kibana start
