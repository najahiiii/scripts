#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-only
#
# Script to setup an Android 10 build
# environment for Fedora 31 / Rawhide.

# Bash color
source $(dirname $0)/color.sh

echo -e "[+] ${CLR_BLD_PPL}Starting RawHide env script...${CLR_RST}"

# Indonesian timezone (GMT+7)
TZ=Asia/Jakarta
sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Initial Update
sudo dnf update -y

# Install packages
bash $(dirname $0)/packages.sh

# meh
echo ""

# The package libncurses5 is not available, so we need to hack our way by symlinking the required library.
if [[ ! /usr/lib/libncurses.so.5 && ! /usr/lib/libtinfo.so.5 ]]; then
    sudo ln -s /usr/lib/libncurses.so.6 /usr/lib/libncurses.so.5
    sudo ln -s /usr/lib/libncurses.so.6 /usr/lib/libtinfo.so.5
fi
    echo -e "[+] ${CLR_BLD_GRN}libncurses already symlinked${CLR_RST}"
    echo ""

# For all those distro hoppers, lets setup your git credentials
GIT_USERNAME="$(git config --get user.name)"
GIT_EMAIL="$(git config --get user.email)"
echo -e "[+] ${CLR_BLD_BLU}Configuring Git${CLR_RST}"
if [[ -z ${GIT_USERNAME} ]]; then
	echo -e "> ${CLR_BLD_RED}Enter your name: ${CLR_RST}"
	read -r NAME
	git config --global user.name "${NAME}"
fi
if [[ -z ${GIT_EMAIL} ]]; then
	echo -e "$> {CLR_BLD_RED}Enter your email: ${CLR_RST}"
	read -r EMAIL
	git config --global user.email "${EMAIL}"
fi
git config --global credential.helper "cache --timeout=7200"
echo -e "[+] ${CLR_BLD_GRN}Setting-up Github credentials setup successfully${CLR_RST}"
echo -e ""
git config --global alias.cp 'cherry-pick'
git config --global alias.cpn 'cherry-pick -n'
git config --global alias.c 'commit'
git config --global alias.f 'fetch'
git config --global core.editor 'nano'

# Generating ssh-key
bash $(dirname $0)/ssh-key.sh

# Repo
echo "[+] Installing Git Repository Tool"
sudo curl --create-dirs -sLo /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo

echo -e "[+] Setting up udev rules for ADB!"
sudo curl --create-dirs -sLo /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules

echo -e "\n[+] ${CLR_BLD_PPL}Done...${CLR_RST}"
