#!/bin/bash


echo "create mysql container.. "

docker run --name sql \
            -it \
            -v /docker/mysql/conf.d:/etc/mysql/conf.d \
            -v /docker/mysql/data:/var/lib/mysql \
            -e MYSQL_ROOT_PASSWORD="123" \
            -p 3306:3306 \
            -d mysql

