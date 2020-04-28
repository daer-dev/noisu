if [ -n $RAILS_ENV ]
then
  if [ $RAILS_ENV == "development" ]
  then
    if [ -n $GIT_EMAIL ]
    then
      git config --global user.email $GIT_EMAIL
      bundle exec overcommit --install
      bundle exec overcommit --sign
    else
      echo -e "ERROR: GIT_EMAIL not set. Skipping Git config.\n"
    fi
  else
    echo -e "RAILS_ENV not ==\"development\". Skipping Git config.\n"
  fi
else
  echo -e "ERROR: RAILS_ENV not set. Skipping Git config.\n"
fi
