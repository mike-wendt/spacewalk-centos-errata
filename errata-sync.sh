#!/bin/bash

# Download latest errata files and import to Spacewalk

## Configure these variables ##
# Spacewalk Username/Password with administrator access
export SPACEWALK_USER='user'
export SPACEWALK_PASS='pass'

# INCLUDE_CHANNELS: Comma separated list of Channel Labels
INCLUDE_CHANNELS='centos7-updates,centos-extras' 
## End of Configure varables ##

# Get this script's base path to use for errata-import.pl execution
BASE_PATH="$(echo ${0} | sed 's/errata-sync.sh//')"

# Download updated files only into the same dir as errata-sync.sh
cd ${BASE_PATH}
wget -N "http://cefs.steve-meier.de/errata.latest.xml"
wget -N "https://www.redhat.com/security/data/oval/com.redhat.rhsa-all.xml"
cd -

# Import errata
${BASE_PATH}errata-import.pl --server localhost --errata ${BASE_PATH}errata.latest.xml --rhsa-oval ${BASE_PATH}com.redhat.rhsa-all.xml --include-channels="${INCLUDE_CHANNELS}" --publish

# Unset vars for security
unset SPACEWALK_USER
unset SPACEWALK_PASS
