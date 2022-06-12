#!/bin/bash

echo "### Stoping containers ..."
docker-compose down

echo "### Starting v ..."
docker-compose -f docker-compose.yml  up --force-recreate --build -d