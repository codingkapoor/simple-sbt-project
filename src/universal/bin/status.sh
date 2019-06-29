#!/bin/bash

CHECK="com.codingkapoor.simplesbtproject.SimpleSbtProject"
PID=`jps | grep SimpleSbtProject | awk '{print $1}'`
STATUS=$(ps aux | grep -v grep | grep ${CHECK})

if [ "${#STATUS}" -gt 0 ] && [ -n ${PID} ]; then
    echo "`date`: SimpleSbtProject is running"
else
    echo "`date`: SimpleSbtProject is not running"
    exit 1
fi
