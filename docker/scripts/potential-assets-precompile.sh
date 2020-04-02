#!/bin/bash

if [ $# -eq 0 ] ; then
  echo 'No argument supplied. Precompiling...'
  RAILS_ENV=production rails assets:precompile
else
  if [ $1 == "not" ] ; then
    echo 'Argument equals "not". Precompile skipped.'
  else
    echo 'Argument supplied but different from "not". Precompiling...'
    RAILS_ENV=production rails assets:precompile
  fi
fi
