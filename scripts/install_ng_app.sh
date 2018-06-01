#!/usr/bin/env bash

source /usr/local/bootstrap/var.env

# Idempotency hack - if this file exists don't run the rest of the script
if [ -f "/var/vagrant_ng_app_exists" ]; then
    exit 0
fi

sudo touch /var/avagrant_ng_app_exists
cd $HOME
ng new $NG_APPLICATION_NAME
cd $HOME/$NG_APPLICATION_NAME
echo $PWD
forever start node_modules/@angular/cli/bin/ng serve --host 0.0.0.0
