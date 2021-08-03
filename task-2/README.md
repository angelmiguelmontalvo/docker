# Engineering Trainnin - Docker

## Tasks2

Steps to create docker image.

Set params for docker label:

$ GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD) 
                     
$ GIT_COMMIT=$(git rev-parse HEAD)              
                      
$ BUILD_AUTHOR=$(git config user.name)          
                   
$ BUILD_VERSION=${1:-"1.0"}                     
                
$ BUILD_DATE=$(date)                            

Build image:

$ docker build -t task2 \
   --build-arg GIT_BRANCH="$GIT_BRANCH" \
   --build-arg GIT_COMMIT="$GIT_COMMIT" \
   --build-arg BUILD_AUTHOR="$BUILD_AUTHOR" \
   --build-arg BUILD_VERSION="$BUILD_VERSION" \
   --build-arg BUILD_DATE="$BUILD_DATE" \
   .
 

Run image, expose port 3101,  attach the volume to current server localtime to get time zone:

$ docker run -v /etc/localtime:/etc/localtime:ro -d -p 3101:3101 --name task-2 task2

### Automated build and publish

Run attached script build-image.sh <version>

$ bash build-image.sh 1.0
