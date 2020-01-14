# Section 5
## Container Lifetime & Persistent Data: Volumes

### Container Lifetime & Persistent Data
* Container are usually immutable and ephemeral
	* "immutable infrastructure": only re-deploy containers, never change
* This is the ideal scenario, but what about databases, or unique data?
	* Docker gives us features to ensure there "separation of concerns", this is known as "persistent data"
* Two ways: Volumes and Bind Mounts
	* Volumes: make special location outside of container UFS
	* Bind Mounts: link container path to host path

### Persistent Data: Data Volumes

`$ docker container run -d --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=True mysql`


```bash
$ docker container inspect mysql

...
	 "Mounts": [
            {
                "Type": "volume",
                "Name": "0ff25598cc8c7d1be756d160afc9587769bafe4ee43b451c966fe699eace999b",
                "Source": "/var/lib/docker/volumes/0ff25598cc8c7d1be756d160afc9587769bafe4ee43b451c966fe699eace999b/_data",  # where the data is stored in the host
                "Destination": "/var/lib/mysql",  # where the data is linked in the container
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ],
	...
	 "Config" : {  
	 	...
            "Volumes": {
                "/var/lib/mysql": {}
            },
            ...
```

List all volumes: `docker volume ls`

* Named volumes: friendly way to assign volumes to containers

`$ docker container run ... -v <volume-name>:<path-in-container> <container-name>`


### Persistent Data: Bind Mounting

* Maps a host file or directory to a container file or directory
	* Basically just two locations pointing to the same file(s)
	* Skips UFS and host files overwrite any in container
* Can't use in Dockerfile, must be at `container run`
	* `... run -v /Users/taciogt/stuff:/path/container` (Docker knows it isn't a volume name because starts with a /)

[Example](course-resources/dockerfile-sample-2)

`docker container run -d --name nginx -p 80:80 -v $(pwd):/usr/share/nginx/html nginx`

Now we can edit the `index.html` file and see it changing in the browser

We can also see all the files in the host from inside the container:

```bash
$ docker container exec -it nginx bash

root@faa75d1dab8b:/# cd usr/share/nginx/html/
root@faa75d1dab8b:/usr/share/nginx/html# ls
Dockerfile  index.html
```


