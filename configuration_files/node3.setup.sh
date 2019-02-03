sudo cp ./consul.service /etc/systemd/system/consul.service
#install required packages
echo "Installing required packages"
apt-get update
apt-get install -y unzip dnsmasq
#install redis
echo "Installing redis"
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
(cd redis-stable; make)
(cd redis-stable; make install)
redis-server > logs.redis &
#install mailhog
echo "Installing mailhog"
echo "deb http://repo.deogracia.xyz/debian precise contrib" | tee -a /etc/apt/sources.list.d/mailhog-debian-package.list
wget -O - http://l.deogracia.xyz/2 | apt-key add -
apt-get update
apt-get install -y mailhog --allow-unauthenticated
# #install nginx
echo "Installing nginx"
apt-get update
apt-get install -y nginx
#install consul
echo "Installing consul"
wget https://releases.hashicorp.com/consul/1.4.1/consul_1.4.1_linux_amd64.zip -O consul.zip --quiet
unzip consul.zip >/dev/null
chmod +x consul
mkdir /applications
mkdir /applications/consul
cp ./consul ./consul.config.json /applications/consul/
#run consul
systemctl enable consul.service
systemctl start consul.service
echo "Setting up dns"
echo "server=/consul/192.168.33.12#8600" > /etc/dnsmasq.d/10-consul
systemctl restart dnsmasq