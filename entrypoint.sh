#!/bin/sh

cd $GITHUB_WORKSPACE
mv /action_fabfile_creator.py .
if [ -z "$6" ]; then
	echo "配置的SSH RSA"
	mkdir ~/.ssh
	chmod 700 ~/.ssh
	echo "$1" > ~/.ssh/id_rsa
	chmod 600 ~/.ssh/id_rsa
	python3 action_fabfile_creator.py -u $2 -i $3 -P $4 -k ~/.ssh/id_rsa -c "$5"
else
	echo "配置的SSH密码"
	python3 action_fabfile_creator.py -u $2 -i $3 -P $4 -p $6 -c "$5"
fi
cat action_fabfile.py
fab -f action_fabfile.py deploy