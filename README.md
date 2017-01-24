# Docker: Node.JS

Docker image [ryzy/node](https://hub.docker.com/r/ryzy/node/) with Node.JS,
yarn and Chromium browser installed.


## Features
* latest NodeJS 6 LTS, yarn
* Chromium browser
* JRE (needed by Selenium WebDriver)
* basic web-related tools: git, curl, patch, jq etc

With it, you can run Karma / Protractor tests inside Docker container.
Perfect for running them in your CI pipeline.


## Usage

```
docker run -ti ryzy/node
docker run -ti ryzy/node node
docker run -ti ryzy/node npm
docker run -ti ryzy/node yarn
```

## Usage with BitBucket pipelines

Below is a sample script you can use for 
[BitBucket pipelines](https://bitbucket.org/product/features/pipelines):

```
image: ryzy/node:latest

pipelines:
  default:
    - step:
        script:
          - yarn install
          - yarn run start:prod & # Send to the background - needed for e2e tests
          - yarn run lint
          - yarn run test:ci
          - yarn run build
          - yarn run build:prod # with -prod settings and AoT
          - yarn run e2e
```


# License

MIT
