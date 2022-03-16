#!/bin/bash
nameContainer="alpine"
nameUser="dr"
docker stop $nameContainer
docker rm $nameContainer
echo $(pwd) $nameContainer
docker run -it  \
--name=$nameContainer --network=nginxNet \
--rm \
--user=$nameUser \
alpine:base fish
# -v $(pwd):~ \
