#! /bin/bash

set +e
sudo docker stop php-app
sudo docker rm php-app
set -e

sudo cp -r ~/appfiles/* ./docker/php-app/
sudo rm -rf ./php-app/appfiles/.git

#builds a new mysql database image

pushd ~/config/docker/php-app
docker build --tag php-app:latest .
popd

sudo docker run --name php-app -p 80:80 -d php-app:latest
