#!/bin/sh

cd $GITHUB_WORKSPACE
pwd
ls
python3 action_fabfile_creator.py -u $2 -i $3 -P $4 -k ~/ssh/.id_rsa -c $5
cat fabfile_creator.py
fab -f fabfile_creator.py deploy