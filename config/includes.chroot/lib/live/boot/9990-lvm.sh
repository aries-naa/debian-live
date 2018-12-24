#!/bin/sh

[ -x /sbin/lvm ] || exit 0

modprobe dm-mod
/sbin/lvm vgscan --ignorelockingfailure --mknodes
/sbin/lvm vgchange -aly --ignorelockingfailure
