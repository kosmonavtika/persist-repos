# `persist-repo.sh`

An `apt` hook for Proxmox VE to make non-subscription repositories and subscription dialog removal persistent.

Please note that this has not been tested extensively. Use it at your own risk! Feel free to contribute and improve it.

## Install

Clone repository:

```
git clone https://github.com/thelander/persist-repos.git
```

Set host: 

```
export PERSIST_HOST=pve.example.com
```

Push hook:

```
scp persist-repos/99persistrepos root@$PERSIST_HOST:/etc/apt/apt.conf.d/99persistrepos
```

Push script:

```
scp persist-repos/persist-repos.sh root@$PERSIST_HOST:/usr/local/bin/persist-repos.sh
```

Make script executable:

```
ssh root@$PERSIST_HOST "/bin/chmod a+x /usr/local/bin/persist-repos.sh"
```

## Use

When you install an update or a package, the hook will invoke the script and make the changes persistent.
