#!/bin/bash

set -e
OVDIR=/etc/openvpn

cd /opt/

if [ ! -f $OVDIR/.provisioned ]; then
  echo "Preparing certificates"
  mkdir -p $OVDIR
  ./scripts/generate_ca_and_server_certs.sh
  openssl dhparam -dsaparam -out $OVDIR/dh2048.pem 2048
  touch $OVDIR/.provisioned
fi

# Generating certificate revocation list file.
echo "Generating crl.pem"
cd /etc/openvpn/keys
source ./vars
export KEY_CN=""
export KEY_NAME=""
export KEY_ALTNAMES=""
$OPENSSL ca -gencrl -out crl.pem -config "$KEY_CONFIG"

cd /opt/openvpn-gui
mkdir -p db
./openvpn-web-ui
echo "Starting!"

