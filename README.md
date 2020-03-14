# _Making Sense of Edge Computing_ — Docker Companion

This repository contains the contents of the Docker Companion used in the Manning book _Making Sense of Edge Computing_. The Docker image can either be built from this repository or pulled prebuilt from the Docker Hub repository: [edgecomputingbook/companion](https://cloud.docker.com/u/edgecomputingbook/repository/docker/edgecomputingbook/companion).

### 1. Requirements
* docker (https://docs.docker.com/install/)

### 2. Getting the Companion image

As stated earlier, there are two ways to get (or update) the Companion image in Docker: build or pull.

###### 2-A. Building the Companion image

You can build the Companion image from the code in this repository by running the following:
```
docker build -t edgecomputingbook/companion .
```

###### 2-B. Pulling the Companion image from Docker Hub

You can pull the Companion image from the Docker Hub by running the following:
```
docker pull edgecomputingbook/companion
```


### 3. Running the Companion

The easiest way to run the companion Docker image is to run the following:
```
docker run --rm -it [-p 8181:8181] edgecomputingbook/companion
```

The `-p 8181:8181` is required if you want to interact with the edge computing testbed's web-based administration dashboard.

---

### Appendix: Running the scripts manually

If you are familiar with the terminal or command prompt of your operating system, the scripts included in this image can be run manually outside of Docker if your system has has the following requirements:
* Java 1.8
* Maven 3 (If you wish to make code modifications)

**NOTE**: The included scripts are written for a Linux base used in the Docker image. If you wish to use these on a Windows machine, you will need to either write .bat files or run the code in the scripts manually.

The main file used to run the edge computing testbed is the `agent-1.0-SNAPSHOT.jar` file. You can either copy this file to the location used in the scripts, or modify the scripts to use the current location of this file. Afterwards, the examples should work similar in your native operating system.
