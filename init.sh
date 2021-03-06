#!/usr/bin/env bash

set -euxo pipefail

GITHUB_USER=$1

cd /root

APT_PACKAGES="python3 python3-pip python3-venv git"
PYTHON_PACKAGES="ansible"

apt_pkgs(){
    apt -y update
    apt -y install $APT_PACKAGES
}

python_pkgs(){
    pip3 install --upgrade pip
    pip3 install $PYTHON_PACKAGES
}

handoff(){
    git clone https://github.com/Oogy/micro-cloud.git
    cd micro-cloud 
    ./playbook.yml --extra-vars="admin_user=$SUDO_USER github_user=$GITHUB_USER"
}

main(){
    apt_pkgs
    python_pkgs
    handoff
    clean
}

clean(){
    rm -rf /root/micro-cloud
}

main
