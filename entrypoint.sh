#!/bin/sh

cd $GITHUB_WORKSPACE
mv /action_fabfile_creator.py .
echo "$5"
mkdir ~/.ssh
chmod 700 ~/.ssh
echo "$1" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
python3 action_fabfile_creator.py -u $2 -i $3 -P $4 -k ~/.ssh/id_rsa -c "$5"
cat action_fabfile.py
fab -f action_fabfile.py deploy