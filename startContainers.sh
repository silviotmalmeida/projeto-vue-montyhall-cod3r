#!/bin/bash

echo "Subindo o container..."
docker-compose up -d --remove-orphans

sleep 5

echo "Definindo permissoes das pastas de volumes..."
docker container exec vue-montyhall bash -c "chmod 777 -R /usr/src/app"
sleep 1

echo "Iniciando o app..."
# iniciando com o servidor de desenvolvimento
docker container exec vue-montyhall bash -c "cd /usr/src/app; npm i; npm run serve"

# criando a build
# docker container exec vue-montyhall bash -c "cd /usr/src/app; npm i; npm run build"
