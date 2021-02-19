FROM node:15.9.0-alpine3.10

WORKDIR /usr/src/lafeli/

COPY package.json .
COPY package-lock.json .

RUN apk add --no-cache git g++ make python && \
    deluser --remove-home node && \
    addgroup -S node -g 1000 && \
    adduser -S -G node -u 1000 node && \
    npm install -g @angular/cli @angular/language-service && \
    npm install

USER node
