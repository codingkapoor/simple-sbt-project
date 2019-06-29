#!/bin/bash

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME_DIR="$(dirname "$BIN_DIR")"
CONF_DIR="${HOME_DIR}/conf"
LIB_DIR="${HOME_DIR}/lib"
LOG_DIR="${HOME_DIR}/logs"

if [ ! -d ${CONF_DIR} ] || [ ! -d ${LIB_DIR} ] || [ ! -d ${LOG_DIR} ]; then
  echo "`date`: Mandatory directory check failed."
  exit 0
fi

echo "Starting SimpleSbtProject..."

nohup java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5007 \
    -server -Dlogback.configurationFile="${CONF_DIR}/logback.xml" \
	-Dconf.dir="${CONF_DIR}" -Dconf.logs="${LOG_DIR}" -cp "${LIB_DIR}/*:${CONF_DIR}/*" \
	com.codingkapoor.simplesbtproject.SimpleSbtProject > "${LOG_DIR}/stdout.log" 2>&1 &

simple_sbt_project_pid=$!

echo
echo "SimpleSbtProject started with PID [$simple_sbt_project_pid] at [`date`]"
