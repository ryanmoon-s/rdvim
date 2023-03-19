#!/bin/bash

sudo yum remove tmux
sudo yum install libevent-devel
sudo yum install libevent

wget https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar -zxvf tmux-3.3a.tar.gz

cd tmux-3.3a
./configure
sudo make 
sudo make install

cd ../
rm -rf tmux-3.3a*

echo
echo "Version:"
tmux -V
