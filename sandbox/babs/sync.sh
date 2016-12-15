#!/bin/bash
# ./sync.sh owner_name repository
cd $2
git pull http://localhost:5555/gitsrv/$1/$2.git
