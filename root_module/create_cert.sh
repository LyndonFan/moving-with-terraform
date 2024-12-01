#!/bin/bash
set -e
set +x

KEY_FILE=private_key.key
CERT_FILE=certificate.crt

openssl req -x509 -newkey rsa:2048 -nodes -days 365 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/C=UK/O=Company/CN=example.co.uk" -outform PEM

awslocal acm import-certificate --certificate $(base64 -i ${CERT_FILE}) --private-key $(base64 -i ${KEY_FILE}) --certificate-chain $(base64 -i ${CERT_FILE})