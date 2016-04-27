#!/bin/sh

#dind docker daemon
    #--host=unix:///var/run/docker.sock \
    #--host=tcp://0.0.0.0:2375 \
    #--storage-driver=vf &

git --version

echo "Building new image with USE_GIT=$USE_GIT or BUILD_IMAGE=$BUILD_IMAGE and DOCKER_FILE_PATH=$DOCKER_FILE_PATH."

if [ "$USE_GIT" == "yes" ]
then
  FILES=`git show --pretty="format:" --name-only | grep -E "^archlinux\/.*\/Dockerfile"`
  echo Changed Dockerfiles:
  echo $FILES
  echo "Building these Dockerfiles now."
  for file in $FILES
  do
    if [ -e "$file" ]
    then
      DIR=${file//\/Dockerfile}
      TAG=${DIR//archlinux\/}
      echo Tagging build from $file with: $TAG
      docker build --no-cache -t "$TAG" "$DIR"
    fi
  done
else
  docker build -t "$BUILD_IMAGE" "$DOCKER_FILE_PATH"
fi
