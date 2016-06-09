#!/bin/bash

if [ "$# -lt 9 ]; then
  echo "Usage: $0 []" >&2
  exit 1
fi

LIQUIBASE_HOME=~/liquibase-3.5.1
DRIVER=org.postgresql.Driver
CLASSPATH=
JDBC_URL_PROTO=jdbc:postgresql://
JDBC_URL=${JDBC_URL_PROTO}${DBHOST}:${DBPORT}/${DBNAME}

${LIQUIBASE_HOME}\liquibase.sh --classpath=${CLASSPATH} \
    --driver=${DRIVER} \
    --changeLogFile= \
    --url= \
    --username
    --password
  diffChangeLog \
    --referenceUrl= \
    --referenceUsername= \
    --referencePassword=
