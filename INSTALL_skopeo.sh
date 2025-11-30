#!/bin/bash
set -e
apt update -y \
  &&  apt install -y uidmap fuse-overlayfs curl wget
wget http://ftp.gwdg.de/pub/opensuse/repositories/home:/alvistack/xUbuntu_22.04/amd64/skopeo_1.20.0-1_amd64.deb
wget http://ftp.gwdg.de/pub/opensuse/repositories/home:/alvistack/xUbuntu_22.04/amd64/containers-common_0.64.2-1_amd64.deb
apt install oci-runtime
apt --fix-broken install
dpkg -i containers-common_0.64.2-1_amd64.deb
dpkg -i skopeo_1.20.0-1_amd64.de
skopeo --version