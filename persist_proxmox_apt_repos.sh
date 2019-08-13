#!/bin/bash

function persist_repos() {

  ENTERPRISE_REPO_FILE="/etc/apt/sources.list.d/pve-enterprise.list"
# addapted for our own use:
# ENTERPRISE_REPO_LINE="# deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise"
  ENTERPRISE_REPO_LINE="deb http://10.8.80.122/debian/pve buster pve-enterprise"
  echo $ENTERPRISE_REPO_LINE > $ENTERPRISE_REPO_FILE

  FREE_REPO_FILE="/etc/apt/sources.list.d/pve-no-subscription.list"
# addapted for our own use:
# FREE_REPO_LINE="deb http://download.proxmox.com/debian/pve buster pve-no-subscription"
  FREE_REPO_LINE="# deb http://download.proxmox.com/debian/pve buster pve-no-subscription"
  echo $FREE_REPO_LINE > $FREE_REPO_FILE

  sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
  sed -i.bak "s/data.status === 'Active'/true/g" /usr/share/pve-manager/js/pvemanagerlib.js
  echo "$0: Updated repositories..."
}

persist_repos
