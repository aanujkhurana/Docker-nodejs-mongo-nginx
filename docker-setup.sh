#!/bin/bash

# Create a network for the containers
docker network create my-network

# Create volume for container
docker volume create mongo-data
docker volume create nginx-config

# Pull the images
docker pull mongo 
docker pull mongo-express
docker pull nginx

# Build the shop-app image from dockerfile in ./
docker build -t my-shop-app .

# Run the shop-app container with the network and volume
docker run -d --name shop-app -v ./:/usr/src/app -p 3000:3000 --network my-network my-shop-app

# Run the mongo container with the network and volume
docker run -d --name mongo -v mongo-data:/data/db -p 27017:27017 --network my-network -e MONGODB_URI=mongodb://mongo:27017/ mongo

# Run the proxy (Nginx) container with the network and volumes
docker run -d --name proxy -v nginx-config:/etc/nginx -v ./ssl/localhost.crt:/etc/ssl/certs/localhost.crt -v ./ssl/localhost.key:/etc/ssl/private/localhost.key -p 80:80 -p 443:443 --network my-network nginx

# Run the mongoexpress container with the network
docker run -d --name mongoexpress -p 8080:8081 --network my-network -e ME_CONFIG_MONGODB_SERVER=mongo -e ME_CONFIG_BASICAUTH_USERNAME=admin -e ME_CONFIG_BASICAUTH_PASSWORD=123456 mongo-express
