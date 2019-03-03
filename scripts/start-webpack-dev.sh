#!/bin/bash

export NODE_OPTIONS=$NODE_OPTIONS && yarn && rm -rf /opt/noisu/public/packs && bin/webpack-dev-server
