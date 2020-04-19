#!/bin/bash

if [ -f tmp/pids/server.pid ]; then
  rm -f -f tmp/pids/server.pid
fi

bundle check || bundle install

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed

bundle exec rails s -p $BIND_ON_PORT -b $BIND_ON
