#!/bin/bash

bundle check || bundle install --binstubs

export NODE_OPTIONS=$NODE_OPTIONS && yarn && rm -rf /opt/noisu/public/packs && bin/webpack-dev-server
