#!/bin/bash

bundle check || bundle install

puma -p $ACTION_CABLE_PORT cable/config.ru
