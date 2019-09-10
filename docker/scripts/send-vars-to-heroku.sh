#!/bin/bash

export $(grep -v '^#' .env)

heroku config:set $(grep -v '^#' .env) -a $HEROKU_PROJECT_NAME
