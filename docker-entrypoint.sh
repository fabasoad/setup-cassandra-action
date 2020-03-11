#!/bin/bash
paramArray=()
paramArray+=($1)
paramArray+=($2)
if [[ -n "${3/[ ]*\n/}" ]]
then
    paramArray+=("-u")
    paramArray+=($3)
fi
if [[ -n "${4/[ ]*\n/}" ]]
then
    paramArray+=("-p")
    paramArray+=($4)
fi
echo "CREATE KEYSPACE IF NOT EXISTS $5 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};" | cqlsh "${paramArray[@]}"
for file_script in $6/*.cql; do
  cqlsh -k $5 -f $file_script "${paramArray[@]}"
  echo "${file_script} had been run"
done