#!/bin/bash
echo "CREATE KEYSPACE IF NOT EXISTS $5 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};" | cqlsh $1 $2 -u $3 -p $4
for file_script in $6/*.cql; do
  cqlsh -k $5 -f $file_script $1 $2 -u $3 -p $4
  echo "${file_script} had been run"
done