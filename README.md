# Dynamic MOTD

## Setup

To install this, with root rights:

* Clone the repo
* Install: `sudo ./install -u <user>`
* Configure widget layout: `vim ./config`
* Configure widgets: `vim ./widgets/<widget-name>`
* Run interactively: `sudo ./generate`

The script runs every hour for system information (cpu, disk, ...) and every day for other information (certificates, packages, ...).

## Profit

```
              .  o ..
              o . o o..o.                __ __
                .  ..o..  .             |  |  |_ _ ___ ___ ___
                      o    o            |     | | | . | -_|  _|
                   __|=|__|=|__         |__|__|_  |  _|___|_|
               ___|____________|____          |___|_|
              | o o o o o o o o o  /
     ~  ~ ~~~~'~~~~~~~~~~~~~~~~~~~'~~~~ ~  ~

  system info:                            network:
    system load:   0.00  process:  99       public ip:   10.20.30.40
    cpu usage:     0%    uptime:   10d      private ip:  192.168.0.10
    memory usage:  10%   users:    1
                                          certificates:
  services:                                 google.fr        valid  01/01/2020
    apparmor:    active    cron:  active    debian.org       valid  01/01/2020
    logrotate:   inactive  lxc:   active    wikipedia.org    valid  01/01/2020
    networking:  active    sshd:  active    domain.org       valid  01/01/2020

  containers:                             disk usage:
    git:   stopped  mailer:  stopped                   Size  Used  Free  Use%
    dlna:  running  plex:    stopped        /         10.0G  1.0G  9.0G   10%
```
