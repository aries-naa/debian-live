#!/bin/sh

set -e

PREREQ=""

prereqs()
{
        echo "${PREREQ}"
}

case ${1} in
prereqs)
        prereqs
        exit 0
        ;;
esac

if [ -d /root/var/lib/netboot ]; then
    rm -rf /root/var/lib/netboot
fi

boot_iface=$(/sbin/ifconfig -a | awk -F "\n" -v RS="\n\n" '/.*inet addr:.*/ {print $1 $2}' | awk '{if($1 != "lo") print $1;}')
if [ -n "${boot_iface}" ]; then

    if [ -x /root/etc/network/netboot ]; then
	if ! new_boot_iface=$(/root/etc/network/netboot ${boot_iface}); then
	    echo Netboot error from ${boot_iface}: ${?}.
	    /bin/sh
	else
	    if [ -n "${new_boot_iface}" ]; then
		boot_iface=${new_boot_iface}
	    else
		echo Netboot error from ${boot_iface}: new boot interface empty.
		/bin/sh
	    fi
	fi
    fi

    mkdir -p /root/var/lib/netboot
    echo netboot_interface=${boot_iface} > /root/var/lib/netboot/boot-interface
fi

exit 0
