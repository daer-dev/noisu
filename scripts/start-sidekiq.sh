#!/bin/bash

bundle check || bundle install --binstubs

sidekiq -C config/sidekiq.yml.erb
