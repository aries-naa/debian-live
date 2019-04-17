# LB_TASK="server esk"

#include(`init-sysv.m4')
include(`init-systemd.m4')

include(`min.m4')
#include(`games.m4')
#include(`rescue.m4')
#include(`terminal.m4')
#include(`firmware.m4')
#include(`virtualization.m4')

#!
#include(`development.m4')
#include(`multimedia.m4')
include(`internet.m4')

#chromium
#chromium-l10n
##if DISTRIBUTION stretch
#chromium-widevine
##endif
##if DISTRIBUTION buster
#chromium-sandbox
##endif

## kde - минимальный набор.
#plasma-desktop
#kwin-x11

## kde - обязательный набор.
#systemsettings
#kscreen
#print-manager
#plasma-pa
#plasma-nm
#powerdevil
#kde-config-screenlocker
#khotkeys
#plasma-widgets-addons
#polkit-kde-agent-1
#kdf
#kde-l10n-ru
#kmenuedit
