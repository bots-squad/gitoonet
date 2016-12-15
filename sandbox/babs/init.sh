#!/bin/bash
# ./init.sh repository
mkdir $1
cd $1
git init

echo "[user]" >> .git/config
echo "  name = babs" >> .git/config
echo "  email = babs@typunsafe.org" >> .git/config
