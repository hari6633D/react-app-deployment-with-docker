#!/bin/bash

#login into DockerHub:
echo $DCOKER_PASS | docker login -u $DOCKER_USERNAME --password-stdin
sudo usermod -aG docker $USER

#stopping existing container:
docker stop react
docker rm react

#building a image:
docker build -t react-ci/cd .

#running a container from the created image:
docker run -d -it --name react -p 80:80 react-ci/cd

#pushing the image to dockerhub:
docker tag react-ci/cd hari6633/react-app:ci-cd
docker push hari6633/react-app:ci-cd
