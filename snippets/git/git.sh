#!/bin/bash
# Copyright (C) 2015 Paranoid Android Project
# Copyright (C) 2018 Ahamd Thoriq Najahi<tlogitechnjhi@gmail.com>
# Copyright (C) 2018 Najahiiii@github

# PA Colors
# red = errors, cyan = warnings, green = confirmations, blue = informational
# plain for generic text, bold for titles, reset flag at each end of line
# plain blue should not be used for readability reasons - use plain cyan instead
CLR_RST=$(tput sgr0)                        ## reset flag
CLR_RED=$CLR_RST$(tput setaf 1)             #  red, plain
CLR_GRN=$CLR_RST$(tput setaf 2)             #  green, plain
CLR_YLW=$CLR_RST$(tput setaf 3)             #  yellow, plain
CLR_BLU=$CLR_RST$(tput setaf 4)             #  blue, plain
CLR_PPL=$CLR_RST$(tput setaf 5)             #  purple,plain
CLR_CYA=$CLR_RST$(tput setaf 6)             #  cyan, plain
CLR_BLD=$(tput bold)                        ## bold flag
CLR_BLD_RED=$CLR_RST$CLR_BLD$(tput setaf 1) #  red, bold
CLR_BLD_GRN=$CLR_RST$CLR_BLD$(tput setaf 2) #  green, bold
CLR_BLD_YLW=$CLR_RST$CLR_BLD$(tput setaf 3) #  yellow, bold
CLR_BLD_BLU=$CLR_RST$CLR_BLD$(tput setaf 4) #  blue, bold
CLR_BLD_PPL=$CLR_RST$CLR_BLD$(tput setaf 5) #  purple, bold
CLR_BLD_CYA=$CLR_RST$CLR_BLD$(tput setaf 6) #  cyan, bold

echo -e "${CLR_BLD_RED} ███▄    █   ▄████  ███▄    █ ▄▄▄█████▓▓█████▄ ${CLR_RST}";
echo -e "${CLR_BLD_RED} ██ ▀█   █  ██▒ ▀█▒ ██ ▀█   █ ▓  ██▒ ▓▒▒██▀ ██▌${CLR_RST}";
echo -e "${CLR_BLD_RED}▓██  ▀█ ██▒▒██░▄▄▄░▓██  ▀█ ██▒▒ ▓██░ ▒░░██   █▌${CLR_RST}";
echo -e "${CLR_BLD_RED}▓██▒  ▐▌██▒░▓█  ██▓▓██▒  ▐▌██▒░ ▓██▓ ░ ░▓█▄   ▌${CLR_RST}";
echo -e "${CLR_BLD_RED}▒██░   ▓██░░▒▓███▀▒▒██░   ▓██░  ▒██▒ ░ ░▒████▓ ${CLR_RST}";
echo -e "${CLR_BLD_RED}░ ▒░   ▒ ▒  ░▒   ▒ ░ ▒░   ▒ ▒   ▒ ░░    ▒▒▓  ▒ ${CLR_RST}";
echo -e "${CLR_BLD_RED}░ ░░   ░ ▒░  ░   ░ ░ ░░   ░ ▒░    ░     ░ ▒  ▒ ${CLR_RST}";
echo -e "${CLR_BLD_RED}   ░   ░ ░ ░ ░   ░    ░   ░ ░   ░       ░ ░  ░ ${CLR_RST}";
echo -e "${CLR_BLD_RED}         ░       ░          ░             ░    ${CLR_RST}";
echo -e "${CLR_BLD_RED}                                        ░      ${CLR_RST}";
echo -e ""
echo -e "${CLR_BLD_BLU}Setting-up Users info...${CLR_RST}"
echo -e ""
# For all those distro hoppers, lets setup your git credentials
GIT_USERNAME="$(git config --get user.name)"
GIT_EMAIL="$(git config --get user.email)"
echo -e "${CLR_BLD_BLU}Configuring Git${CLR_RST}"
if [[ -z ${GIT_USERNAME} ]]; then
	echo -e "${CLR_BLD_RED}Enter your name: ${CLR_RST}"
	read -r NAME
	git config --global user.name "${NAME}"
fi
if [[ -z ${GIT_EMAIL} ]]; then
	echo -e "${CLR_BLD_RED}Enter your email: ${CLR_RST}"
	read -r EMAIL
	git config --global user.email "${EMAIL}"
fi
git config --global credential.helper "cache --timeout=7200"
echo -e "${CLR_BLD_GRN}Setting-up Github credentials setup successfully${CLR_RST}"
echo -e ""
git config --global alias.cp 'cherry-pick'
git config --global alias.cpn 'cherry-pick -n'
git config --global alias.c 'commit'
git config --global alias.f 'fetch'
echo -e "${CLR_BLD_BLU}Ok, Beres. Ngntd...${CLR_RST}"
