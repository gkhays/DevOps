#!bin/bash

# TODO - We need some variables up in here!

DRIVER=org.postgresql.Driver
JDBC_PROTO=jdbc:postgresql://
JDBC_URL="${JDBC_PROTO}${HOST}:${PORT}/${DBNAME}"

# TODO - As with the diff script, we can invoke liquibase.sh
# see http://www.liquibase.org/documentation/command_line.html
${LIQUIBASE_HOME}/liquibase  -Dfile.encoding=UTF-8 \
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
