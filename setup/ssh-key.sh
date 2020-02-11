#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-only
#
# Script to setup an Android 10 build
# environment for Fedora 31 / Rawhide.

# Bash color
source $(dirname $0)/color.sh

# Generating ssh-key for git ssh creds using git email conf
if [[ ! -e ~/.ssh/id_rsa ]]; then
    echo -e "\n" | ssh-keygen -t rsa -b 4096 -C "$(git config user.email)" -N "" -q
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo -e "[+] ${CLR_BLD_GRN}Github ssh-key succesefully generated${CLR_RST}"
    echo -e ""
fi
    echo -e "[+] ${CLR_BLD_YLW}Github ssh-key already exists, skipping...${CLR_RST}"
    echo -e ""
