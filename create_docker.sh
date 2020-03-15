#!/bin/bash

docker-compose up --build -d
docker exec dldocker /root/init.sh
docker exec dldocker bash
docker port dldocker