FROM node:14.17.6-alpine

RUN mkdir -p /usr/src/
WORKDIR /usr/src/

COPY [".babelrc", "/usr/src/"]

RUN npm install -g npm@8.1.1

RUN apk --no-cache add \
      bash \
      g++ \
      ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev \
      make \
      python3
RUN apk add --no-cache --virtual .build-deps gcc zlib-dev libc-dev bsd-compat-headers py-setuptools bash

COPY . .

RUN ls .

RUN npm install

ENTRYPOINT [ "npm", "run", "test"]