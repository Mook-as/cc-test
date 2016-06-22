#!/bin/sh

set -o errexit -o nounset

service mysql start
/usr/bin/mysql -u root -D mysql -e "update user set password=password('password') where user='root'"
/usr/bin/mysql -u root -e "flush privileges"

export GOPATH=/workspace

rsync -ha /src/. /workspace/src/github.com/cloudfoundry/cloud_controller_ng
cd /workspace/src/github.com/cloudfoundry/cloud_controller_ng
bundle install

export DB=mysql
export DB_CONNECTION_STRING='mysql2://root:password@localhost:3306/cc_test'
bundle exec rake db:create
bundle exec rake
