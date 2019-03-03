#!/bin/bash

bundle check || bundle install

puma -p 28080 cable/config.ru
