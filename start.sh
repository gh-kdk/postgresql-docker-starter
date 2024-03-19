#!/bin/bash

cd "$(dirname "$0")" || exit

# shellcheck source=.env
source .env

mkdir -p volumes/postgresql
mkdir -p volumes/pgadmin

docker compose -f docker-compose.yml config
docker compose -f docker-compose.yml up --no-deps --build --force-recreate
docker compose -f docker-compose.yml rm -f -s
