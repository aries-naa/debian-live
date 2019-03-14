include(`min.m4')

sudo
xfonts-75dpi
xfonts-100dpi
xfonts-terminus
xfonts-terminus-dos
xfonts-terminus-oblique
fonts-freefont-ttf
fonts-liberation
ttf-mscorefonts-installer

#if DISTRIBUTION wheezy jessie
fonts-droid
#endif
#if DISTRIBUTION stretch
fonts-droid-fallback
#endif

openssh-client
openssh-server
zsh
man-db
x11-apps
console-terminus
menu
menu-l10n
xinetd
laptop-detect
laptop-mode-tools
procps
pm-utils
hdparm
cpufrequtils
info
screen
obconf
ifplugd
bridge-utils
iptables-persistent
dnsutils
menu-xdg
ifenslave
vlan
acpi
acpitool
apcupsd
sdparm
bluez
bluez-tools
rfkill
pppoe
pppoeconf
wireless-tools
wpasupplicant
lm-sensors
snmp
i2c-tools
pmount
udisks2
upower
ntpdate
aufs-tools
file
telnet
tftp
lftp
curl
wget
desktop-base
lynx
elinks
bc
dialog
eject
snmpd
lshw
exim4-daemon-light
iotop

#if DISTRIBUTION jessie stretch
snmptrapd
#endif

snmptrapfmt
uml-utilities
links2
smartmontools
rdate
open-vm-tools
sysstat
ifstat
ddccontrol
ntp
anacron
logrotate
vim-nox
vim-doc

# архивация.
gzip
bzip2
unzip
zip
lzma
mscompress
xz-utils
sharutils
sharutils-doc

# настройка сети.
network-manager
network-manager-openvpn
network-manager-pptp
network-manager-ssh
modemmanager
modemmanager-doc
usb-modeswitch
