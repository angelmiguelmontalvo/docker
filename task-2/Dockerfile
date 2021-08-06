FROM node:alpine as builder

WORKDIR /src

RUN apk update && apk add --no-cache tzdata

COPY . .

RUN npm install

FROM builder

WORKDIR /src

COPY --from=builder /src /src

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

EXPOSE 3101

RUN npm install

CMD  [ "node", "index.js" ]
