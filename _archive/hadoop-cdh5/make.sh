#!/bin/bash

set -e -o pipefail

sudo docker build -t naelyn/cdh5 .
#sudo docker push naelyn/cdh5
