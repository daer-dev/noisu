#!/bin/bash

bundle check || bundle install --binstubs

puma -p 28080 cable/config.ru
