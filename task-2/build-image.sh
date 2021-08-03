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

docker build -t task2 \
   --build-arg GIT_BRANCH="$GIT_BRANCH" \
   --build-arg GIT_COMMIT="$GIT_COMMIT" \
   --build-arg BUILD_AUTHOR="$BUILD_AUTHOR" \
   --build-arg BUILD_VERSION="$BUILD_VERSION" \
   --build-arg BUILD_DATE="$BUILD_DATE" \
   .

docker tag task2 angelmiguelmontalvo/task2:miguel.montalvo

docker tag task2 10.24.191:8082/task2:miguel.montalvo

docker tag task2 docker.jala.pro/task2:miguel.montalvo

echo "Done"


