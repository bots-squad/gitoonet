#!/bin/bash
# ./push.sh owner_name repository

cd $2
echo "some documentation" > DOC.md
git add .
git commit -m "add DOC.md"
git push http://localhost:5555/gitsrv/$1/$2.git master
