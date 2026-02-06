#!/bin/bash

cp -f /home/ubuntu/work/etc/ssh/* /home/ubuntu/.ssh/
chown ubuntu.ubuntu /home/ubuntu/.ssh/*

gh auth login
gh extension install github/gh-copilot

