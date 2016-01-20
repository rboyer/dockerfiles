#!/bin/bash
#
# Startup script for Artifactory in Tomcat Servlet Engine
#

set -euo pipefail
IFS=$'\n\t'

die() {
    echo "ERROR: ${1}"
    exit 1
}

export ARTIFACTORY_HOME=/opt/artifactory
#export ARTIFACTORY_USER=app
#export ARTIFACTORY_PID="${ARTIFACTORY_HOME}/run/artifactory.pid"

export JAVA_OPTIONS="-server -Xms512m -Xmx2g -Xss256k -XX:PermSize=128m -XX:MaxPermSize=256m -XX:+UseG1GC"

export TOMCAT_HOME="${ARTIFACTORY_HOME}/tomcat"
export CATALINA_HOME="${TOMCAT_HOME}"
export CATALINA_OPTS="${JAVA_OPTIONS} -Dartifactory.home=${ARTIFACTORY_HOME} -Dfile.encoding=UTF8"
#export CATALINA_PID="${ARTIFACTORY_PID}"

[[ -d "${ARTIFACTORY_HOME}" ]] || die "Artifactory home folder not defined or does not exists at ${ARTIFACTORY_HOME}"
[[ -d "${TOMCAT_HOME}" ]] || die "Tomcat Artifactory folder not defined or does not exists at ${TOMCAT_HOME}"


# use volumes for this stuff
rm -rf "${ARTIFACTORY_HOME}/logs" && mkdir -p /logs && ln -sf /logs "${ARTIFACTORY_HOME}/logs"
rm -rf "${ARTIFACTORY_HOME}/data" && mkdir -p /data && ln -sf /data "${ARTIFACTORY_HOME}/data"

# setup some tomcat stuff
mkdir -p /logs/catalina
ln -sf /logs/catalina "${TOMCAT_HOME}/logs"

# make sure the user can touch this stuff
chown -R app:app /data /logs

exec su -c "${TOMCAT_HOME}/bin/catalina.sh run" app

