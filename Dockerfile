# Build:
# docker build -t urlshortener .
#
# Run:
# docker run -it urlshortener

# Create image based on the official Node 6 image from dockerhub
FROM node:boron
MAINTAINER Chaman
LABEL Description="Dockerfile for MEAN based URL Shorten application"

# We need to expose ports for Node.js (3000), MongoDB (27017) and LiveReload (35729)
EXPOSE 3000 27017 35729

# Let's setup our project. We need to create a working directory first, clone the project and configure it

RUN mkdir -p /usr/src/urlshortener/
WORKDIR /usr/src/urlshortener

# Clone urlshortener repository
RUN git clone https://github.com/chamanklalwani/urlshortener.git /usr/src/urlshortener

# Install npm packages
COPY package.json /usr/src/urlshortener/package.json
RUN npm install

# Bundle app source
COPY . /usr/src/urlshortener

# Run MEAN server
CMD npm start
