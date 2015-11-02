#!/bin/bash

# Setup CentOS errata sync

# Install prerequisites
echo -e "\n>> Installing required packages..."
yum -y install wget perl perl-Frontier-RPC perl-Text-Unidecode perl-XML-Simple

# Get latest import script and extract
echo -e "\n>> Downloading errata..."
cd /opt/spacewalk-centos-errata/
curl http://cefs.steve-meier.de/errata-import.tar > errata-import.tar
tar xf errata-import.tar
cd -

# Setup cron task
echo -e "\n>> Creating cron task in /etc/cron.d/spacewalk-centos-errata..."
cat > /etc/cron.d/spacewalk-centos-errata <<EOL
MAILTO=""
0 6 * * * root /bin/bash /opt/spacewalk-centos-errata/errata-sync.sh 2>&1 > /opt/spacewalk-centos-errata/errata.log
EOL

# Complete
echo -e "\n>> spacewalk-centos-errata installation completed."
