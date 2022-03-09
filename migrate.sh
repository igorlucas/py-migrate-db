#!/bin/bash

set -e

export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )

# cloud_sql_proxy -instances=$CLOUDSQL_INSTANCE=tcp:5432 -credential_file=/app/credentials.json &

# sleep 10

migrate execute
