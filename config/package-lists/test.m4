# LB_TASK="server esk"

#include(`init-sysv.m4')
include(`init-systemd.m4')

include(`base.m4')
include(`firmware.m4')

chromium
chromium-l10n
#if DISTRIBUTION stretch
chromium-widevine
#endif
#if DISTRIBUTION buster
chromium-sandbox
#endif

# kde - минимальный набор.
plasma-desktop
kwin-x11

# kde - обязательный набор.
systemsettings
kscreen
print-manager
plasma-pa
plasma-nm
powerdevil
kde-config-screenlocker
khotkeys
plasma-widgets-addons
polkit-kde-agent-1
kdf
kde-l10n-ru
kmenuedit
