#! /usr/bin/env bash

set -eu

#
# This is only for the initial bootstrapping of the Rails project and should not be needed again.
#

[ -f Gemfile.lock ] && echo 'Gemfile.lock detected. Project is already initialized.' && exit 1

docker run -v $(pwd)/:/app -w /app ruby:3.3 bundle install 

docker build -t shadetree-app-init:latest -f Dockerfile ./

docker run -it -v $(pwd):/app shadetree-app-init:latest rails new /app --name shadetree --api --force
