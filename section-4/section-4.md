# Section 4: Container Images - Where To Find Them and How to Build Them

## What is an image
* App binaries and dependencies
* Metadata about the image data and how to run the image
* Not a complete OS. No kernel, kernel modules (unlike a VM)

## The Might Hub: Using Docker Hub Registry Images

## Image and their Layers: Discover the Image Cache

```
docker image pull nginx
docker image pull nginx:alpine
docker image history nginx
docker image history nginx:alpine
```

* Images are made up of file system changes and metadata
* Each layer is uniquely identified and only stored once on a host
* This saves storage space on host and transfer time on push/pull
* A container is just a single read/write layer on top of image
* `docker image history` and `inspect` commands can teach us

## Image Tagging and Pushing to Docker Hub
Image is referenced by three informations: `<user>/<repo>:<tag>`
* Properly tagging images
* Tagging images for upload to Docker Hub
* How tagging is related to image ID
* The Latest tag is just the "default" tag

## Building Images: The Dockerfile Basics

Environment variables: one reason they were chosen as preferred way to inject key/value is they work everywhere, on every OS and config

## Building Images: Running Docker Builds

## Building Images: Extending Official Image

## Assignment

```
cd assignments/dockerfile-assignment-1
docker build . -t taciogt/docker-mastery_node-app
docker container run --rm --publish 80:3000 taciogt/docker-mastery_node-app

``` 