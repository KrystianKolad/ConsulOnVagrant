Consul On Vagrant
===============

My Vagrantfile which contains 3 nodes. Each node has installed Consul, Redis, Elasticsearch and Nginx. All Consuls have been configured to communicate with each other and discover services installed on their nodes.

Just run
```
vagrant up
```
to start all nodes and 
```
vagrant destroy -f
```
to stop them.

This vagrantfile is an example of configuring consul with multiple nodes. Feel free to change configuration and install more stuff.