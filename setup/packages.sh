#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-only
#
# Script to setup an Android 10 build
# environment for Fedora 31 / Rawhide.

# Bash color
source $(dirname $0)/color.sh

# Env
LATEST_MAKE_VERSION="4.3"

# Check if alaready exists
if [[ ! /etc/yum.repos.d/che-llvm.repo && ! /etc/yum.repos.d/lantw44-arm-gcc.repo && ! /etc/yum.repos.d/lantw44-arm64-gcc.repo ]]; then
    echo -e "[${CLR_BLD_GRN}+${CLR_RST}] ${CLR_BLD_GRN}Copying Copr repo file...${CLR_RST}\n"
    sudo cp setup/che-llvm.repo /etc/yum.repos.d/
    sudo cp setup/lantw44-arm-gcc.repo /etc/yum.repos.d/
    sudo cp setup/lantw44-arm64-gcc.repo /etc/yum.repos.d/
fi
    echo -e "[${CLR_BLD_YLW}!${CLR_RST}] ${CLR_BLD_YLW}Copr repo already exists, skipping...${CLR_RST}\n"

# Packages
echo -e "[${CLR_BLD_GRN}+${CLR_RST}] ${CLR_BLD_GRN}Installing packages...${CLR_RST}\n"
sudo dnf install -qy \
    aarch64-linux-gnu-{binutils,gcc,glibc} \
    arm-linux-gnueabi-{binutils,gcc,glibc} \
    autoconf213 \
    axel \
    bison \
    bzip2 \
    clang \
    ccache \
    curl \
    flex \
    gawk \
    gcc-c++ \
    git \
    glibc-devel \
    glibc-static \
    libstdc++-static \
    libX11-devel \
    make \
    llvm \
    lld \
    m4 \
    mesa-libGL-devel \
    ncurses-devel \
    patch \
    zlib-devel \
    ncurses-devel.i686 \
    readline-devel.i686 \
    zlib-devel.i686 \
    libX11-devel.i686 \
    mesa-libGL-devel.i686 \
    glibc-devel.i686 \
    libstdc++.i686 \
    libXrandr.i686 \
    zip \
    perl-Digest-SHA \
    python2 \
    wget \
    lzop \
    openssl-devel \
    java-1.8.0-openjdk-devel \
    ImageMagick \
    ncurses-compat-libs \
    schedtool \
    lzip \
    vboot-utils \
    screen \
    htop \
    neofetch \
    git-subtree

if [[ "$(command -v make)" ]]; then
    makeversion="$(make -v | head -1 | awk '{print $3}')"
    if [[ "${makeversion}" != "${LATEST_MAKE_VERSION}" ]]; then
        echo -e "[${CLR_BLD_GRN}+${CLR_RST}] ${CLR_BLD_GRN}Installing make ${LATEST_MAKE_VERSION} instead of ${makeversion}${CLR_RST}"
        bash $(dirname $0)/make.sh "${LATEST_MAKE_VERSION}"
    fi
fi

# Install gdrive-cli
echo -e "[${CLR_BLD_GRN}+${CLR_RST}] ${CLR_BLD_GRN}Installing gdrive-cli...${CLR_RST}\n"
sudo install bin/gdrive /usr/bin/
