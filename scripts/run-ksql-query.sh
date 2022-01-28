#!/bin/bash

# Parameter: A .sql file containing a ksqlDB query.

# example:
# ./run-ksql-query path/to/myquery.sql

# This script takes a ksqlDB query file and executes it within 
# a ksqldb-cli container run with docker-compose,
# assuming the query file has been mounted in the /tmp directory of the container.

docker-compose exec ksqldb-cli bash -c " cat <<EOF
RUN SCRIPT '/tmp/$1';
exit ;
EOF
"