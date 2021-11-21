#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="wot"
iso_label="DONUT"
iso_publisher="lockness Ko <https://lockness-Ko.github.io/wot>"
iso_application="WOT linux"
iso_version="2.0.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlz4hc,12')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
