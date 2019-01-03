#!/usr/bin/env bash

rake db:auto_migrate
bundle exec rackup config.ru -p $PORT
