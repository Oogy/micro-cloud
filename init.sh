#!/usr/bin/env bash

set -euxo posix

APT_PACKAGES="python3 python3-pip python3-venv openssh-server git"
PYTHON_PACKAGES="ansible"
ADMIN_SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9yZlg7wYPxClZM5NumS8MonWPtuF85DasxbUBV9MUQVF7iDUBGmlnz2Cc5QZf5F27R5g+tm0CaghoT7V4FCH9AfuoslVR+8qtfCA2eCkJScQvBlUz1bhhtzqU8qH/tlcsZMaEj/NM+mo9OQYVUNx9nPghmUpVELIcOtxkPQn+YOS6kr6A10phf157HQcHgP91fgjMrncnCEYZhDq9+fRCNWGA6r3RZv683m3jFaYiS7sUDEGwIyFo/hc2HGpP/UTEbYOjHn+AyKCi5wK+9pPvCrFdiNcZrM6Y5FUiQLFLR9un9kczDhME2vLBkSU6FfuX1Ha6x8uqsZJK2cKIZNA4sn3xxti63I4UC/Q7CkJ8dLFFwA8wFq2RMnL19j1DvENI6dLLCRjPuqTTPcZmtoIaFdCCaRxD6CWL6c633NrMCzLQuvVkWU/AUYEUXTOjVVU3S1fl5nHGXo6ZwA3Ipxl6LTPFfipWv1A5/Y+yNJvhcSBH+bjGxuVuF/KmWatCS7tYXO4hdlELMlzcNdcjdFUlCGUf1fCgDOFaoViMFI1ccloCuxN9oNdWJFstU4DG6o6QInKDdELNqgJdAys6ExtSP0MbTnThJiKm5HVa7tII4bnJLWi7TUKhSILKwAwnkfCH121O846cB3st/GMR2hsFikUE98ra1K6G7pSYhaKMow=="

apt_pkgs(){
    apt -y update
    apt -y install $APT_PACKAGES
}

python_pkgs(){
    pip3 install --upgrade pip
    pip3 install $PYTHON_PACKAGES
}

setup_ssh(){
    systemctl enable sshd
    systemctl start sshd
    echo $ADMIN_SSH_KEY >> ~/.ssh/authorized_keys
    ufw allow ssh
    ufw enable
}

handoff(){
    git clone https://github.com/Oogy/lil-cloudy.git
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
