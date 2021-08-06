#!bin/bash
echo "Building docker image task2"

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "branch "$GIT_BRANCH
GIT_COMMIT=$(git rev-parse HEAD)
echo "comit "$GIT_COMMIT
BUILD_AUTHOR=$(git config user.name)
echo "author "$BUILD_AUTHOR
BUILD_VERSION=${1:-"1.0"}
echo "version: "$BUILD_VERSION
BUILD_DATE=$(date)
echo "date: "$BUILD_DATE

docker build -t final_task \
   --build-arg GIT_BRANCH="$GIT_BRANCH" \
   --build-arg GIT_COMMIT="$GIT_COMMIT" \
   --build-arg BUILD_AUTHOR="$BUILD_AUTHOR" \
   --build-arg BUILD_VERSION="$BUILD_VERSION" \
   --build-arg BUILD_DATE="$BUILD_DATE" \
   .

docker tag final_task angelmiguelmontalvo/final_task:miguel.montalvo

docker tag final_task 10.24.191:8082/final_task:miguel.montalvo

docker tag final_task docker.jala.pro/docker-training/final_task:miguel.montalvo

echo "Done"
