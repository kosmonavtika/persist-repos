# `persist_proxmox_apt_repos.sh`

An `apt` hook for Proxmox VE 6 to make non-subscription repositories and subscription dialog removal persistent.

Please note that this has not been tested extensively. Use it at your own risk! Feel free to contribute and improve it.

## Install

Clone repository:

```
git clone https://github.com/leancode/persist-repos.git
```

Set host: 

```
export PERSIST_HOST=pve.example.com
```

### Make sure you can authenticate to the remote host via SSH before doing the next steps

Push hook:

```
scp persist-repos/99persistrepos root@$PERSIST_HOST:/etc/apt/apt.conf.d/99persistrepos
```

Push script:

```
scp persist-repos/persist_proxmox_apt_repos.sh root@$PERSIST_HOST:/usr/local/bin/persist_proxmox_apt_repos.sh
```

Make script executable:

```
ssh root@$PERSIST_HOST "/bin/chmod a+x /usr/local/bin/persist_proxmox_apt_repos.sh"
```

Run the script for the first time manually for the changes to take effect:

```
ssh root@$PERSIST_HOST "/usr/local/bin/persist-repos.sh"
```
In the future the script will automatically run when you install an update or a package. The hook will invoke the script and make the changes persistent if they were undone by the update / upgrade.

