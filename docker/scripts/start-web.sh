#!/bin/bash

if [ -f tmp/pids/server.pid ]; then
 rm -f -f tmp/pids/server.pid
fi

bundle check || bundle install --binstubs

rake db:create
rake db:migrate
rake db:seed

rails s -p $BIND_ON_PORT -b $BIND_ON
