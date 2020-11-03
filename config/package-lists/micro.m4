live-boot
live-config

aptitude
acpid
acpi-support
#gpm
##isc-dhcp-client
#ethtool
#less
mc
lvm2
#cifs-utils
ifupdown
net-tools
iputils-ping
policykit-1

xserver-xorg
xserver-xorg-core

xserver-xorg-video-all
xserver-xorg-input-all

#if ARCHITECTURES i386
xserver-xorg-video-geode
#endif

#xserver-xorg-video-glide
xserver-xorg-video-modesetting
xserver-xorg-video-ati
xserver-xorg-video-qxl
xserver-xorg-video-intel
xserver-xorg-video-mga
xserver-xorg-video-openchrome
xserver-xorg-video-radeon
#if DISTRIBUTION stretch buster
xserver-xorg-video-cirrus
xserver-xorg-video-savage
xserver-xorg-video-siliconmotion
xserver-xorg-video-sisusb
xserver-xorg-video-tdfx
xserver-xorg-video-trident
xserver-xorg-video-mach64
xserver-xorg-video-r128
#endif

xserver-xorg-input-mouse
xserver-xorg-input-evdev
xserver-xorg-input-joystick
xserver-xorg-input-multitouch
xserver-xorg-input-wacom
xserver-xorg-input-synaptics

#if DISTRIBUTION stretch buster
xserver-xorg-input-aiptek
xserver-xorg-input-mutouch
#endif

xinit
##xfonts-base
xterm
lightdm
lightdm-gtk-greeter
#gnome-icon-theme

##if DISTRIBUTION buster
#breeze-gtk-theme
##endif

##if DISTRIBUTION stretch
#gtk3-engines-breeze
##endif

openbox
x11-utils
x11-xserver-utils
xinput
xvkbd
#ntfs-3g
#rsyslog
#vim
locales
##alsa-utils
##console-setup
##acl
##attr
##cgroup-tools
##mdadm
#udhcpc
#cryptmount
#cryptsetup

##if DISTRIBUTION stretch
#ecryptfs-utils
##endif

#info
#exfat-fuse
#exfat-utils
