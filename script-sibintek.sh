#!/bin/bash

DEST_DIR="./code"
REPO_URL="https://github.com/Lissy93/dashy.git"
C_NAME="dashy-app"

git clone $REPO_URL $DEST_DIR

cd $DEST_DIR
sudo docker build -t dashy-local:latest . -f ../Dockerfile-local

sudo docker stop ${C_NAME}
sudo docker rm ${C_NAME}
sudo docker run -d --name ${C_NAME} -p 4000:80 --restart=always dashy-local:latest

# simple check
resp_code=$(curl -Is 127.0.0.1:4000 | awk 'NR==1 {print $2}')
if [ $resp_code -eq "200" ]; then
  echo "Script finished success"
else
  exit 1
fi
