#!/bin/bash

mkdir code
dir=./code
URL=https://github.com/Lissy93/dashy.git

git clone $URL $dir

sudo docker build -t dashy-image:latest ./code

sudo docker run -d --name dashy-app dashy-image:latest





