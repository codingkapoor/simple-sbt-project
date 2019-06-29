#!/bin/bash

PID=`jps | grep SimpleSbtProject | awk '{print $1}'`

COUNTER=0

if [ "${#PID}" -gt 0 ]
then
	kill ${PID}
	while [[ ( -d /proc/${PID} ) && ( -z `grep zombie /proc/${PID}/status` ) ]]
	do
    	echo "`date`: Waiting for SimpleSbtProject to gracefully stop"
    	sleep 10
    	COUNTER=$(($COUNTER+1))
    	if [ "$COUNTER" -gt 10 ]; then kill -9 ${PID}; break; fi
	done
	echo "`date`: SimpleSbtProject stopped"
else
	echo "`date`: SimpleSbtProject was not running"
fi
