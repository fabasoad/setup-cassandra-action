#!/bin/bash
paramArray=()
paramArray+=("$1")
paramArray+=("$2")
if [[ -n "${3/[ ]*\n/}" ]]
then
    paramArray+=("-u")
    paramArray+=("$3")
fi
if [[ -n "${4/[ ]*\n/}" ]]
then
    paramArray+=("-p")
    paramArray+=("$4")
fi
paramArray+=("--cqlversion=$CQLSH_VERSION")
paramArray+=("--connect-timeout=$5")
if ! echo "CREATE KEYSPACE IF NOT EXISTS $6 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};" | cqlsh "${paramArray[@]}"
then
  exit 1
fi
for file_script in "$7"/*.cql; do
  if ! cqlsh -k "$6" -f $file_script "${paramArray[@]}"
  then
    exit 1
  fi
  echo "${file_script} had been run"
done