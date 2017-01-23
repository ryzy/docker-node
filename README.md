# Docker: Node.JS with NVM

Docker image [ryzy/node](https://hub.docker.com/r/ryzy/node/) with Node.JS 
and NVM installed, based on CentOS 7.

## Features
* latest Node 6 LTS
* yarn package manager
* git >= 2.11
* basic web-related tools: wget patch jq tar bzip2 unzip ssh etc

## Usage

```
docker run -ti ryzy/node
docker run -ti ryzy/node node
docker run -ti ryzy/node npm
docker run -ti ryzy/node yarn
```

---
