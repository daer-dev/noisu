#!/bin/bash

bundle check || bundle install

if [ -f tmp/pids/server.pid ]; then
 rm -f -f tmp/pids/server.pid
fi

bundle exec rails s -p $BIND_ON_PORT -b $BIND_ON
