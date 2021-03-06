#!/usr/bin/env bash

set -euxo pipefail

APT_PACKAGES="python3 python3-pip python3-venv openssh-server git"
PYTHON_PACKAGES="ansible"

apt_pkgs(){
    apt -y update
    apt -y install $APT_PACKAGES
}

python_pkgs(){
    pip3 install --upgrade pip
    pip3 install $PYTHON_PACKAGES
}

setup_ssh(){
    systemctl enable ssh
    systemctl start ssh
    ufw allow ssh
    ufw enable
}

handoff(){
    git clone https://github.com/Oogy/micro-cloud.git
    cd lil-cloudy
    ./playbook.yml
}

main(){
    apt_pkgs
    python_pkgs
    setup_ssh
    handoff
}

main
