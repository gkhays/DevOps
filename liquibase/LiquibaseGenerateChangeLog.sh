#!bin/bash

# TODO - We need some variables up in here!

JAR=liquibase-core-3.4.2.jar
DRIVER=org.postgresql.Driver
JDBC_PROTO=jdbc:postgresql://
JDBC_URL="${JDBC_PROTO}${HOST}:${PORT}/${DBNAME}"

java  -Dfile.encoding=UTF-8 \
    -jar ${JAR} \
    --classpath=${CLASSPATH} \
    --driver=${DRIVER} \
    --url="${JDBCURL}" \
    --username=${USER} \
    --password=${PASS} \
    --logLevel=info \
    --changeLogFile=${CHANGELOGFILE} \
    --dataOutputDirectory=${OUTDIR} \
    --diffTypes=${DIFFTYPES} \
  generateChangeLog
