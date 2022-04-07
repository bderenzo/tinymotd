# Tinymotd

Tinymotd generate a configurable dynamic motd via shell script

## Features

* Easy configuration and customisation
* Tiny (<100kb) optimized scripts
* Minimal dependencies

## Demo

![tinymotd](./motd.png)

## Setup

To install this, with root rights:

* Clone the repo
* Install: `./install -u <user>`
* Configure: `vim ./config`
* Run interactively: `./generate`

The script runs:
* every hour for system information (cpu, disks, ...)
* every day for other information (certificates, packages, ...)
