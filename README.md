# Dynamic MOTD

## Setup

To install this, with root rights:

* Clone the repo
* Install: `sudo ./install -u <user>`
* Configure widget layout: `vim ./layout.conf`
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

system info:                           network:
  system load   0.50  tasks   199        public ip   10.20.30.40
  cpu usage     0%    uptime  10d        private ip  192.168.0.10
  memory usage  10%   users   1
  temperature   40°c  kernel  v5.4     disk usage:
                                                  Size  Used  Free  Use%
services:                                /        10G   1.0G  9.0G  10%
  syslog     active  cron   active       +lxc     100G  10G   90G   10%
  logrotate  active  sshd   active
  network    active  lxc    active     packages:
  iptables   active  lxcfs  active       no new package avalaible...

containers:                            last execution:
  git    running  media   running        Wednesday 20 January, 23:27:18
  blog   running  mailer  running
```
