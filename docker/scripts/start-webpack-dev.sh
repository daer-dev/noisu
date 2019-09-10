#!/bin/bash

bundle check || bundle install

export NODE_OPTIONS=$NODE_OPTIONS && yarn && rm -rf /opt/noisu/public/packs && WEBPACKER_DEV_SERVER_PORT=$WEBPACK_PORT WEBPACKER_DEV_SERVER_HOST=$WEBPACK_HOST WEBPACKER_DEV_SERVER_PUBLIC=$WEBPACK_PUBLIC_HOST:$WEBPACK_PORT bin/webpack-dev-server
