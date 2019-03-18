#!/bin/bash

function persist_repos() {
  ENTERPRISE_REPO_LIST="/etc/apt/sources.list.d/pve-enterprise.list"
  FREE_REPO_LIST="/etc/apt/sources.list.d/pve-no-subscription.list"
  FREE_REPO_LINE="deb http://download.proxmox.com/debian/pve stretch pve-no-subscription"
  echo $FREE_REPO_LINE > $FREE_REPO_LIST
  rm -f $ENTERPRISE_REPO_LIST
  sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
  echo "$0: Updated repositories..."
}

persist_repos
