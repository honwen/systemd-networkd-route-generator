#!/bin/bash

curl -sSL 'http://119.29.29.29/d?dn=ppa.launchpad.net' | sed 's+,.*++g' | sed 's+\.[0-9][0-9]*$+.0/24+g' >ips-v4.txt
