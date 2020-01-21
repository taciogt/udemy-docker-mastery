# Section 6
## Making It Easier with Docker Compose: The Multi-Container Tool

### Docker Compose and The docker-compose.yml File

* Why?
	* Configure relationships between containers
	* Save our docker container run settings in easy-to-read file
	* Create one-linver developer environment startups

* Comprised of 2 separate but related things
	1. YAML-formatted file that describes the solution options for
		* containers
		* networks
		* volumes
	1. A CLI tool `docker-compose` used for local dev/test automation with YAML files

It was used for local docker automation, but since early 2017 it can be used in production with Swarm (v1.13)

### Trying Out Basic Compose Commands

* CLI tool comes with Docker for Windows/Mac, but separate download for Linux
* Not a production-grade tool, but ideal for local development and test
* Two most common commands are
	* `docker compose up`  # setup volumes/networks and start all containers
	* `docker-compose down` # stop all containers and remove containers/volumes/networks

Some useful commands:
* `docker-compose up`
	* `docker-compose up -d`
* `docker-compose down`
* `docker-compose ps`
* `docker-compose top`