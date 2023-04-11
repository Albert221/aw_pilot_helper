#!/bin/sh

password="$1"
find . -name '*.enc' -exec sh -c 'openssl aes-256-cbc -d -in $0 -out ${0%.enc} -k $1' {} $password \;
