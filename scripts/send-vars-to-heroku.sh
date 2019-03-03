#!/bin/bash

export $(grep -v '^#' config/.env)
heroku config:set $(grep -v '^#' config/.env) -a $HEROKU_PROJECT_NAME
