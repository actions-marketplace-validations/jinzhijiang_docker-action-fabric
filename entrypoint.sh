#!/bin/sh

cd $GITHUB_WORKSPACE
mv /action_fabfile_creator.py .
echo "$5"
python3 action_fabfile_creator.py -u $2 -i $3 -P $4 -k ~/ssh/.id_rsa -c "$5"
pwd
ls
cat action_fabfile.py
fab -f action_fabfile.py deploy