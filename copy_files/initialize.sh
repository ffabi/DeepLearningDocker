#!/bin/bash

service ssh start
less /root/copy_files/bashrc_append.txt >> /root/.bashrc
./root/copy_files/tmux-session restore
