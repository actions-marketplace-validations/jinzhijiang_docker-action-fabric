#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import getopt

user = None
ip = None
port = None
password = None
key_filepath = None
code = 'pass'

argv = sys.argv[1:]

try:
    opts, args = getopt.getopt(argv, "u:i:P:p:k:c:",  
                               ["user=",
                                "ip=",
                                "port=",
                                "password=",
                                "key_filepath=",
                                "code="])  # 长选项模式
except:
    print("Error")
 
for opt, arg in opts:
    if opt in ['-u', '--user']:
        user = arg
    elif opt in ['-i', '--ip']:
        ip = arg
    elif opt in ['-P', '--port']:
    	port = arg
    elif opt in ['-p', '--password']:
    	password = arg
    elif opt in ['-k', '--key_filepath']:
    	key_filepath = arg
    elif opt in ['-c', '--code']:
    	code = arg

with open('action_fabfile.py', 'w') as af:
	ucode = "env.sudo_user = 'root'" if user == "root" else ("env.user = '%s'" % user)

	pcode = ('env.password = "%s"' % password) if key_filepath is None else ("env.key_filename = '%s'" % key_filepath)

    pycode = ""
    for line in code.strip().split("\n"):
        pycode += line.strip() + "\n\t"

	af.write('''#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from fabric.api import *

# 服务器登录用户名:
%s
# 服务器端口号
env.port = 22111
# 服务器地址，可以有多个，依次部署:
env.hosts = ['%s@%s']
%s

def deploy():
	%s
''' % (ucode, user, ip, pcode, pycode))
