#!/bin/bash

docker compose down
docker compose rm
sudo systemctl restart docker
sudo rm -rf htdocs
rm docker-compose.yml

