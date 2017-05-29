#!/bin/bash
############################
# Testing on: ubuntu-trusty-64 3.13.0-117-generic
############################

apt-get update
apt-get upgrade -y 
apt-get install vim wget net-tools mlocate strace nmap telnet ansible git -y

wget https://artifacts.elastic.co/downloads/logstash/logstash-5.3.2.deb -O /tmp/logstash-5.3.2.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.3.2.deb -O /tmp/elasticsearch-5.3.2.deb

add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install openjdk-8-jdk -y

dpkg --install /tmp/logstash-5.3.2.deb && dpkg --install /tmp/elasticsearch-5.3.2.deb

sed -i 's/-Xms2g/-Xms256M/g' /etc/elasticsearch/jvm.options
sed -i 's/-Xmx2g/-Xmx256M/g' /etc/elasticsearch/jvm.options

sed -i 's/#path.data: \/path\/to\/data/path.data: \/var\/lib\/elasticsearch /g' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#http.port: 9200/http.port: 9200/g' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#cluster.name: my-application/cluster.name: elastic/g' /etc/elasticsearch/elasticsearch.yml

/etc/init.d/elasticsearch start

