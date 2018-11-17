#install redis
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
(cd redis-stable; make)
(cd redis-stable; make install)
systemctl start redis
#install nginx and elastic
apt-get update
apt-get install -y nginx apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt-get update 
apt-get install -y elasticsearch
#install consul
apt-get update
apt-get install -y unzip
wget https://releases.hashicorp.com/consul/1.4.0/consul_1.4.0_linux_amd64.zip -O consul.zip --quiet
unzip consul.zip >/dev/null
chmod +x consul
#run consul
./consul agent -bind "192.168.33.11" -join "192.168.33.10" -node=node2 -dev -config-file=./node2.consul.config.json -client "0.0.0.0"  > logs.consul &