FROM redis:5.0.3-alpine

MAINTAINER Daniel Herrero <daniel.herrero.101@gmail.com>

ENV INSTALL_PATH /noisu

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY ./scripts ./scripts

RUN chmod 777 ./scripts/*.sh

RUN apk add --update bash && rm -rf /var/cache/apk/*
