#!/bin/bash

if [ -f tmp/pids/server.pid ]; then
 rm -f -f tmp/pids/server.pid
fi

bundle check || bundle install --binstubs

bin/rake db:create
bin/rake db:migrate
bin/rake db:seed

bin/rails s -p $BIND_ON_PORT -b $BIND_ON
