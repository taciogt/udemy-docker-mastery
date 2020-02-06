# Section 7
## Swarm Intro and Creating a 3-Node Swarm Cluster

### Swarm Mode: Built-in Orchestration

Container Everywhere = New Problems
* How do we automate container lifecycle?
* How can we easily scale out/in/up/down?
* How can we ensure our containers are re-created if they fail?
* How can we replace containers without downtime (blue/green deploy)?
* How can we control/track wheere containers get started?
* How can we create cross-node virtual networks?
* How can we ensure only trusted servers run our containers?
* How can we store secrets, keys, passwords and get them to the right container (and only that container)?


**Solution: Swarm Mode** - a clustering solution built in inside Docker 

* Not related to Swarm "classic" for pre-1.12 versions
* Added in 1.12 (Summer 2016) via SwarmKit toolkit
* Enhanced in 1.13 (January 2017) via Stacks and Secrets
* Not enabled by default, new commands once enabled
    * `docker swarm`
    * `docker node`
    * `docker service`
    * `docker stack`
    * `docker secret`
    
### Create Your First Service and Scale It Locally

Check if Swarm is active: `docker info`

Activate Swarm: `docker swarm init`

* Lots of PKI and security automation
    * Root Signing Certificate create for our Swarm
    * Certificate is issued for first Manager node
    * Join token are created
* Raft database created to store root CA, configs and secrets
    * Encrypted by default on disk (1.13+)
    * No need for another key/value system to hold orchestration/secrets
    * Replicates logs amongst Managers via mutual TLS in "control plane"
    
```sh
docker node ls 
docker node --help
``` 

```sh
# creates a basic service with only one container
docker service --help 
docker service create alpine ping 8.8.8.8 
docker service ls
docker service ps <service-name>

# scale up the service already running
docker service update <service-id> --replicas 3
docker service ls
docker service ps <service-name>

docker update --help
# docker service have more options to update so it can be used in production environments (like to roll blue/green deployments)
docker service update --help

# remove a container from the service and another one will be created to keep the desired capacity
docker container ls
docker container rm -f <container-id>
docker service ls # shows 2/3 replicas
docker service ls # shows 3/3 replicas
docker service ps <service-name>

docker service rm <service-name>
docker service ls
docker container ls
docker container ls
```

### Create 3-Node Swarm: Host Options

...