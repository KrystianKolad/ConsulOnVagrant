#install redis
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
(cd redis-stable; make)
(cd redis-stable; make install)
systemctl start redis
#install nginx and elastic
apt-get update
apt-get install -y nginx apt-transport-https unzip
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt-get update 
apt-get install -y elasticsearch
#install consul
wget https://releases.hashicorp.com/consul/1.4.0/consul_1.4.0_linux_amd64.zip -O consul.zip --quiet
unzip consul.zip >/dev/null
chmod +x consul
#run consul
./consul agent -dev -server -bind "192.168.33.12" -join "192.168.33.11" -node=node3 -config-file=./node3.consul.config.json -client "0.0.0.0" > logs.consul &