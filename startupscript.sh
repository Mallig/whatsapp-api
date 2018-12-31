#!/usr/bin/env bash
echo $PORT
bundle exec rackup config.ru -p $PORT
