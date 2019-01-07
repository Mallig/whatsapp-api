#!/usr/bin/env bash

# rake db:auto_upgrade
bundle exec rackup config.ru -p $PORT
