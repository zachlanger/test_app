#!/bin/bash

cd /root
mkdir .ssh
chmod 700 .ssh
cd .ssh
touch authorized_keys
chmod 600 authorized_keys