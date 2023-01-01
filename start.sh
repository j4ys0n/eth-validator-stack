#!/bin/bash

if [ ! -d "prometheus_data" ]; then
    mkdir -p prometheus_data
fi

if [ ! -d "grafana_data" ]; then
    mkdir -p grafana_data
fi

if [[ ! -f jwtsecret && ! -f /mnt/data/geth/geth/jwtsecret ]]; then
    docker-compose up -d geth
    sleep 10
fi

if [[ ! -f jwtsecret && -f /mnt/data/geth/geth/jwtsecret ]]; then
    cp /mnt/data/geth/geth/jwtsecret jwtsecret
fi

docker-compose up -d