# Section 8
## Swarm Basic Features and How to Use Them In Your Workflow

### Scaling Out with Overlay Networking

It's a new network driver: just choose `--driver overlay` when creating network. It creates a swarm wide bridge network, the containers cross host connects to each other like a VLAN. Only for intra-swarm communication. Tt can enable full network encyption (IPSec). Each service can be connected to multiple networks (front-end and backend, for example).

```
# on node 1:
docker network create --driver overlay mydrupal
docker network ls
docker service create --name psql --network mydrupal -e POSTGRES_PASSWORD=mypass postgres
docker service ls

docker service create --name drupal --network mydrupal -p 80:80 drupal
# the drupal service is probably running in another node
docker service ps drupal 
```
Access the Drupal service by any IP of the nodes. To configure the database, use the service name as the host (`psql`).

### Scaling Out with Routing Mesh
* Routes ingress (incoming) packets for a Service to proper Task
* Spans all nodes in Swarm
* Uses IPVS from Linux Kernel
* Load balances Swarm Services across their Tasks (and listens on all nodes for traffic)
* Two ways this works:
	* Container-to-container in a Overlay network (uses VIP)
	* External traffic incoming to published ports (all nodes listen) -> you don't have to worry about what node is running the container.

```
# on node 1:
docker service create --name search --replicas 3 -p 9200:9200 elasticsearch:2
docker service ps search
curl localhost:9200  # each time you run this you get one of three names because the localhost:9200 is routed to one of the tasks (one of the nodes) each time

```

* This is stateless load balancing
* This LB is at OSI Layer 3 (TCP), not Layer 4 (DNS)
* Both limitation can be overcome with:
	* Nginx or HAProxy LB proxy, or:
	* Docker Enterprise Edition, which comes with built-in L4 web proxy


