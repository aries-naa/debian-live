#!/bin/sh

#set -e

do_cifsmount ()
{
	rc=1

	if [ -x "/sbin/mount.cifs" ]
	then
		if [ -z "${NFSOPTS}" ]
		then
			CIFSOPTS="user=root,password="
		else
			CIFSOPTS="${NFSOPTS}"
		fi

		log_begin_msg "Trying mount.cifs ${NFSROOT} ${mountpoint} ${CIFSOPTS}"
		modprobe -q cifs
		
		if mount.cifs "${NFSROOT}" "${mountpoint}" -o "${CIFSOPTS}"
		then
			rc=0
		fi
	fi

	return ${rc}
}
