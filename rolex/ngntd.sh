#!/bin/bash
# Copyright (C) 2015 Paranoid Android Project
# Copyright (C) 2018 Ahmad Thoriq Najahi<tlogitechnjhi@gmail.com>
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

usage() {

printf "\n\033[1musage: $0 [o / p]\033[0m\n"
printf "\nJust available for Oreo and Pie :"
printf "\no         - for Oreo (Lineage-15.1)"
printf "\np         - for Pie (lineage-16.0)\n"
}
echo -e ""
echo -e "${CLR_BLD_RED} ███▄    █   ▄████  ███▄    █ ▄▄▄█████▓▓█████▄ ${CLR_RST}";
echo -e "${CLR_BLD_RED} ██ ▀█   █  ██▒ ▀█▒ ██ ▀█   █ ▓  ██▒ ▓▒▒██▀ ██▌${CLR_RST}";
echo -e "${CLR_BLD_RED}▓██  ▀█ ██▒▒██░▄▄▄░▓██  ▀█ ██▒▒ ▓██░ ▒░░██   █▌${CLR_RST}";
echo -e "${CLR_BLD_RED}▓██▒  ▐▌██▒░▓█  ██▓▓██▒  ▐▌██▒░ ▓██▓ ░ ░▓█▄   ▌${CLR_RST}";
echo -e "${CLR_BLD_RED}▒██░   ▓██░░▒▓███▀▒▒██░   ▓██░  ▒██▒ ░ ░▒████▓ ${CLR_RST}";
echo -e "${CLR_BLD_RED}░ ▒░   ▒ ▒░░░▒   ▒ ░ ▒░   ▒ ▒░  ▒ ░░    ▒▒▓  ▒ ${CLR_RST}";
echo -e "${CLR_BLD_RED}░ ░░   ░ ▒░░ ░   ░ ░ ░░   ░ ▒░  ░ ░     ░ ▒  ▒ ${CLR_RST}";
echo -e "${CLR_BLD_RED}   ░   ░ ░ ░ ░   ░    ░   ░ ░   ░       ░ ░  ░ ${CLR_RST}";
echo -e "${CLR_BLD_RED}         ░       ░          ░           ░ ░    ${CLR_RST}";
echo -e "${CLR_BLD_RED}                                        ░      ${CLR_RST}";
echo -e ""
[ -z "$1" ] && usage && exit
if [ $1 = "o" ]
  then
echo -e "${CLR_BLD_BLU}Cloning Device, Vendor, Kernel sources...${CLR_RST}"
git clone https://github.com/najahiiii/android_device_xiaomi_rolex.git -b lineage-15.1 device/xiaomi/rolex
git clone https://github.com/najahiiii/android_vendor_xiaomi_rolex.git -b lineage-15.1 vendor/xiaomi/rolex
git clone https://github.com/najahiiii/ngntdkernel_f.git kernel/xiaomi/msm8917
echo -e "${CLR_BLD_BLU}Cloning Complete...${CLR_RST}"
echo -e ""
echo -e "${CLR_BLD_BLU}Oke gass...${CLR_RST}"
echo -e ""
echo -e ""

elif [ $1 = "p" ]
  then
echo -e ""
echo -e "${CLR_BLD_BLU}Cloning Device, Vendor, Kernel sources...${CLR_RST}"
git clone https://github.com/najahiiii/android_device_xiaomi_rolex.git -b lineage-16.0 device/xiaomi/rolex
git clone https://github.com/najahiiii/android_vendor_xiaomi_rolex.git -b stable vendor/xiaomi/rolex
git clone https://github.com/najahiiii/ngntdkernel_f.git kernel/xiaomi/msm8917
echo -e "${CLR_BLD_BLU}Cloning Complete...${CLR_RST}"
echo -e ""
echo -e "${CLR_BLD_BLU}Oke gass...${CLR_RST}"
echo -e ""
else
usage
printf "\n\e[1;31mERROR:\e[0m Nub, bangsad: $1\n"
fi
