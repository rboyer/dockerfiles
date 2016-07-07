#!/bin/sh

set -x

exec ./src/mesos-slave --master=localhost:5050 --work_dir=./tmp 2>&1 
