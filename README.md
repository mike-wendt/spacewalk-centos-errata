# spacewalk-centos-errata

## Overview
Spacewalk doesn't automatically download errata for CentOS and these scripts are to setup and enable automatic download of errata daily based on the perl script from Steve Meier <http://cefs.steve-meier.de/>.

## Prerequisites
To run Steve Meier's perl script via `errata-sync.sh`, the following packages must be installed:
`yum install perl perl-Frontier-RPC perl-Text-Unidecode perl-XML-Simple`

## Install
Clone this repo to `/opt` and run `sudo /opt/spacewalk-centos-errata/install.sh` to finish install.

## Configure
Once installed edit `errata-sync.sh` and change the environment variables to your spacewalk user name, password, and the channels to search during the errata import.

### Cron Task
By default a cron task runs daily at 6am, but can be changed in `/opt/cron.d/spacewalk-centos-errata`

## Use
Run `/opt/spacewalk-centos-errata/errata-sync.sh` to download the latest XML files with errata updates and begin scanning packages to match

## License
MIT License for project in file `LICENSE`

## Fixes & Issues
Submit issues and pull requests as needed and I'll respond as soon as I can
