#!/bin/bash

default_gateway=$(cat gateway.txt)
default_table=$(cat table.txt)

cat <<-EOF | tee 99-wg0.network
$(
  for it in $(find .asn -mindepth 1 -maxdepth 1 -type d); do
    echo "# $it"
    echo "# AllowedIPs=$(cat $it/ips-v4.txt | tr '\n' ' ')"
    gateway=$(cat $it/gateway.txt || echo $default_gateway)
    table=$(cat $it/table.txt || echo $default_table)
    for cidr in $(cat $it/ips-v4.txt); do
      cat <<-EEOF
[Route]
Destination=$cidr
Gateway=$gateway
Table=$table
GatewayOnlink=yes

EEOF
    done
  done
)
EOF
