#!/bin/bash
docker stop $(docker ps -q);
sudo docker-compose -f docker-compose-php7.yml up --abort-on-container-exit &&
sudo docker-compose -f docker-compose-php5.yml up --abort-on-container-exit
