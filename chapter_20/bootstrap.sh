#!/bin/bash
sudo apt update
sudo apt install -y ansible
sudo ansible-pull -U https://github.com/myusername/ansible.git
