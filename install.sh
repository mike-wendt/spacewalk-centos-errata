#!/bin/bash

# Setup CentOS errata sync

# Install wget
yum install -y wget

# Get latest import script and extract
curl http://cefs.steve-meier.de/errata-import.tar > errata-import.tar
tar xf errata-import.tar

# Setup cron task
cat > /etc/cron.d/spacewalk-centos-errata <<EOL
MAILTO=""
0 6 * * * root /bin/bash /opt/spacewalk-centos-errata/errata-sync.sh 2>&1 > /opt/spacewalk-centos-errata/errata.log
EOL
