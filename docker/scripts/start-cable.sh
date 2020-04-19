#!/bin/bash

bundle check || bundle install

bundle exec puma -p $ACTION_CABLE_PORT cable/config.ru
