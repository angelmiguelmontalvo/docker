FROM node:alpine

ARG GIT_BRANCH
ENV BRANCH=$GIT_BRANCH
ARG GIT_COMMIT
ENV COMMIT=$GIT_COMMIT
ARG BUILD_AUTHOR
ARG BUILD_DATE
ARG BUILD_VERSION

RUN echo "$GIT_COMMIT"
	
LABEL com.jalasoft.engineeringTraining.author=$BUILD_AUTHOR \
      com.jalasoft.engigeeringTraining.date=$BUILD_DATE \
      com.jalasoft.engineeringTraining.version=$BUILD_VERSION \
      com.jalasoft.engineeringTraining.commit=$COMMIT \
      com.jalasoft.engineeringTraining.branch=$BRANCH

RUN apk update && apk add --no-cache tzdata

WORKDIR /src

COPY . .

RUN npm install

CMD  [ "node", "index.js" ]
