# NSBT Docker Image Having All The Basic Tools Needed To Start A Compiler Projects.


## Building from scratch with random generated name

* `docker build .`

For more detailed output, use:

* `docker build . --progress=plan`

# Basic Instructions Manual for `Dockerfile`
* Build a Docker Image
```bash
$ docker build -t nsbt:cs .
```
* Run Docker Image Call nsbt and Name it as nbit
```bash
$ docker run --name nbit -dit nsbt:cs # or
$ docker run -v ~/:/home --name nbit -it nsbt:cs
```
* Log into the running Docker container
```bash
$ docker exec -it nbit bash

* Stop a container 
```bash
$ docker stop  nbit

```
* Starting a Docker container
```bash
$ docker start  nbit 

* Start the gcc Docker Image
```bash
$ docker start -ai nsbt
```
* Removing Docker container
```bash
$ docker rm  nbit

* remove all docker
```bash

* Removing  a Docker image
```bash
$ docker rmi nsbt:cs

$ docker rm -f $(docker ps -a -q)
```
* remove all docker images
```bash
$ docker rmi -f $(docker images -a -q)
```

* ### Note:: You can use any name you like: eg docker build -t love:latest .
* Windows users should install Docker with WSL
* A Video Tutorial Guide  to help you setup [https://www.youtube.com/watch?v=2ezNqqaSjq8]

