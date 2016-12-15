#!/bin/bash
# ./clone.sh owner_name repository

git clone http://localhost:5555/gitsrv/$1/$2.git
cd $2
echo "[user]" >> .git/config
echo "  name = buster" >> .git/config
echo "  email = buster@typunsafe.org" >> .git/config
