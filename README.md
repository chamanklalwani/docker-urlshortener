## Dockerfile for MEAN based URL Shortener application

This Dockerfile will create a working Docker environment for [URL Shortener](https://github.com/chamanklalwani/urlshortener) application.

### Prerequisites

* Install Docker on your machine.

### Installtion


Pull and run MongoDB Docker container from Docker Hub

```
docker pull mongo
```

```
docker run -p 27017:27017 -d --name db mongo
```

This will run MongoDB container from Docker Hub as a background process (`-d` option) with `db` name and with port `27017` exposed.

### Build and Run "URL Shortener" app image:

```
docker build -t urlshortener .
```

This will build a Docker image using current repository. After this, we can run our own Docker container:

```
docker run -p 3000:3000 -p 35729:35729 --name urlshortener --link db:db urlshortener
```

This will run our own container (which will install prerequisites and Node.js), with ports `3000` (Node.js), `27017` (MongoDB) and `35729` (LiveReload) exposed; a link between our image and MongoDB image will be created using `--link` option.



