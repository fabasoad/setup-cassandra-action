#!/bin/bash
echo "var 1: $1"
echo "var 2: $2"
echo "var 3: $3"
echo "var 4: $4"
echo "var 5: $5"
echo "var 6: $6"
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
paramArray+=("--cqlversion=$CQLSH_VERSION")
paramArray+=("--request-timeout=6000")
echo "CREATE KEYSPACE IF NOT EXISTS $5 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};" | cqlsh "${paramArray[@]}"
if [[ $? -ne 0 ]]
then
  exit 1
fi
for file_script in $6/*.cql; do
  cqlsh -k $5 -f $file_script "${paramArray[@]}"
  if [[ $? -ne 0 ]]
  then
    exit 1
  fi
  echo "${file_script} had been run"
done