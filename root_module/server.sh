#!/bin/bash
set -e

apt-get update
apt-get install -y python3 python3-pip

cp webserver.py /opt/domain_webserver.py

pip3 install http.server
python3 /opt/domain_webserver.py &
# intentional trailing & to run in the background