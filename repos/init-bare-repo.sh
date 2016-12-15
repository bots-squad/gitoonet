#!/bin/bash
# initialize a shared repository for a user
# ./init-bare-repo.sh user_name repository_name
mkdir -p $1
cd $1
git init $2.git --bare -q
