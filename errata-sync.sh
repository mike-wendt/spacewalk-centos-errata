#!/bin/bash

# Download latest errata files and import to Spacewalk

# Config vars
export SPACEWALK_USER='user'
export SPACEWALK_PASS='pass'
INCLUDE_CHANNELS='centos7-updates,centos-extras' #This should be comma separated list of channel names 

# Download updated files only
wget -N "http://cefs.steve-meier.de/errata.latest.xml"
wget -N "https://www.redhat.com/security/data/oval/com.redhat.rhsa-all.xml"

# Import errata
./errata-import.pl --server localhost --errata errata.latest.xml --rhsa-oval com.redhat.rhsa-all.xml --include-channels="${INCLUDE_CHANNELS}" --publish

# Unset vars for security
unset SPACEWALK_USER
unset SPACEWALK_PASS
