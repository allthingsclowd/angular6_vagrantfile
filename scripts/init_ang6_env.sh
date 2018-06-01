#!/usr/bin/env bash

source /usr/local/bootstrap/var.env

which curl build-essential git nodejs &>/dev/null || {
  apt-get update
  apt-get install -y curl build-essential git
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  apt-get install -y nodejs
  sleep 1
  npm install forever -g
}

# Idempotency hack - if this file exists don't run the rest of the script
if [ -f "/var/vagrant_ng_setup" ]; then
    exit 0
fi

touch /var/avagrant_ng_setup
npm install -g @angular/cli
