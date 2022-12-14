#!/bin/bash

usage()
{
	echo "Worpress installation using docker compose (wordpress, mysql images)"
	echo "Usage: $0 [-p <host_listen_port:80> ] | [-h]  "
}

DB_ROOT_PASS=$(echo "$RANDOM-$RANDOM-$RANDOM" | md5sum| head -c 32)
DB_WPUSER_PASS=$(echo "$RANDOM-$RANDOM-$RANDOM" | md5sum| head -c 32)
WP_HOST_PORT=80

while [ "$1" != "" ]; do
    case $1 in
        -p | --port )           shift
                                WP_HOST_PORT=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

echo "Generating docker-compose.yml from template"
sed "s/DB_ROOT_PASS/${DB_ROOT_PASS}/g; s/DB_WPUSER_PASS/${DB_WPUSER_PASS}/g; s/WP_HOST_PORT/${WP_HOST_PORT}/g" docker-compose.yml.tmpl > docker-compose.yml

echo "Starting up services using docker-compose.yml"
docker compose up -d

echo "All done. Wordpress available on http://localhost:$WP_HOST_PORT"

