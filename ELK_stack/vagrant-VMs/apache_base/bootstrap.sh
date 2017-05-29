# update and upgrade system
apt-get update
apt-get upgrade -y 

# Install basic packages
apt-get install vim wget net-tools mlocate strace nmap telnet ansible git apache2 -y

# donwload logstash
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.3.2.deb -O /tmp/logstash-5.3.2.deb

# Create a basic index to test
echo "<html><h1> Webserver base </h1><html>" >/var/www/html/index.html

# Add repo and install java
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install openjdk-8-jdk -y

# Install logstash
dpkg --install /tmp/logstash-5.3.2.deb

# Start apache service
/etc/init.d/apache2 start

# download logstash apache config
wget https://github.com/jpradoar/GaMTools/blob/master/ELK_stack/logstash-apache.conf /etc/logstash/conf.d/logstash-apache.conf 

# start logstash
/usr/share/logstash/bin/logstash  -f /etc/logstash/conf.d
