#!/bin/bash

curl -sSL https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[]|.ipv4Prefix' goog.json | grep '/' >ips-v4.txt
