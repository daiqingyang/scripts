#!/bin/bash
#安装py3
set -e
. functions.sh
if [ `id -u` -ne 0 ];then 
  echo "need root"
  exit 1
fi

mkdir /opt/
yum install -y openssl-devel sqlite-devel readline readline-devel  zlib* libffi-devel

cd /tmp/
wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz
tar -xvf Python-3.8.2.tgz
cd Python-3.8.2
./configure --prefix=/opt/python3.8/ --enable-shared
make && make install
cp /opt/python3.8/lib/libpython3.8.so.1.0 /lib64/
cd /opt/python3.8/bin
./pip3 install ipython
ln -sf /opt/python3.8/bin/python3.8 /bin/py38
ln -sf /opt/python3.8/bin/pip3 /bin/pip38
ln -sf /opt/python3.8/bin/ipython /bin/ipython38
cat >/etc/pip.conf <<EOF
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host = https://pypi.tuna.tsinghua.edu.cn
EOF
pip38 install virtualenv
ln -s  /opt/python3.8/bin/virtualenv  /bin/virtualenv38

insert /etc/vimrc "set tabstop=4"
insert /etc/vimrc "set softtabstop=4"
insert /etc/vimrc "set shiftwidth=4"
insert /etc/vimrc "set expandtab"
