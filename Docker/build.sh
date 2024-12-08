#!/bin/bash
docker build -t custom_mariadb -f dockerfiles/mariadb/Dockerfile dockerfiles/mariadb/
docker build -t custom_wordpress -f dockerfiles/wordpress/Dockerfile dockerfiles/wordpress/
docker build -t custom_nginx -f dockerfiles/nginx/Dockerfile dockerfiles/nginx/
