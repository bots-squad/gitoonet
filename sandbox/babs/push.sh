#!/bin/bash
# ./push.sh owner_name repository
cd $2
echo "# Yo project" > README.md
git add .
git commit -m "add README.md"
git push http://localhost:5555/gitsrv/$1/$2.git master
