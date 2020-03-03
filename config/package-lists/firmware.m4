#
# ## - пакеты, содержащие программы загрузки микрокода.
#      Необходима процедура загрузки.
#
# firmware-ipw2x00 firmware-ivtv - установка тебует взаимодействия с пользователем.
#

atmel-firmware
bluez-firmware
dahdi-firmware-nonfree

#if DISTRIBUTION wheezy
firmware-adi
firmware-ralink
#endif

#if DISTRIBUTION jessie stretch
firmware-misc-nonfree
firmware-amd-graphics
firmware-crystalhd
firmware-zd1211
sigrok-firmware-fx2lafw
#endif

firmware-atheros
firmware-bnx2
firmware-bnx2x
firmware-brcm80211
firmware-intelwimax
firmware-ipw2x00
firmware-ivtv
firmware-iwlwifi
firmware-libertas
#firmware-linux
firmware-linux-free
firmware-linux-nonfree
firmware-myricom
firmware-netxen
firmware-qlogic
firmware-realtek
firmware-samsung
firmware-ti-connectivity
midisport-firmware

broadcom-sta-dkms

## при недоступности инета - скачать и положать в образ.

firmware-b43-installer
firmware-b43legacy-installer

# annex
#broadcom-bt-firmware
