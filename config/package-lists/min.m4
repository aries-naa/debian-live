live-boot
live-config

aptitude
acpid
acpi-support
#-base
gpm
isc-dhcp-client
ethtool
less
mc
lvm2
cifs-utils
ifupdown
net-tools
iputils-ping
policykit-1

xserver-xorg
xserver-xorg-core
xserver-xorg-video-all
xserver-xorg-video-ati

#if ARCHITECTURES i386
xserver-xorg-video-geode
#endif

#xserver-xorg-video-glide
xserver-xorg-video-modesetting
xserver-xorg-video-qxl
xserver-xorg-video-intel
#xserver-xorg-video-cirrus
xserver-xorg-video-mach64
xserver-xorg-video-mga
xserver-xorg-video-openchrome
xserver-xorg-video-r128
xserver-xorg-video-radeon
xserver-xorg-video-savage
xserver-xorg-video-siliconmotion
xserver-xorg-video-sisusb
xserver-xorg-video-tdfx
xserver-xorg-video-trident
xserver-xorg-input-all

#if DISTRIBUTION wheezy jessie
xserver-xorg-input-vmmouse
#endif

xserver-xorg-input-mouse
xserver-xorg-input-aiptek
xserver-xorg-input-evdev
xserver-xorg-input-joystick
xserver-xorg-input-multitouch
xserver-xorg-input-mutouch
xserver-xorg-input-wacom
xserver-xorg-input-synaptics

xinit
xfonts-base
xterm
lightdm
lightdm-gtk-greeter
gnome-icon-theme

#if DISTRIBUTION buster
breeze-gtk-theme
#endif

#if DISTRIBUTION stretch
gtk3-engines-breeze
#endif

openbox
x11-utils
x11-xserver-utils
xinput
xvkbd
ntfs-3g
rsyslog
vim
locales
alsa-utils
console-setup
acl
attr
cgroup-tools
mdadm
udhcpc
cryptmount
cryptsetup

#if DISTRIBUTION wheezy jessie stretch
ecryptfs-utils
#endif

info
exfat-fuse
exfat-utils
