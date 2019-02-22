include(`live.m4')

dzen2
suckless-tools
xtightvncviewer
xvnc4viewer
openbox
i3-wm
i3lock
i3status
fetchmail
evince
myspell-ru
mythes-ru
emacs
emacs-goodies-el
org-mode
bbdb
alsa-tools-gui
aconnectgui
mesa-utils
libglu1-mesa
gnucash
gnucash-docs

#if DISTRIBUTION wheezy
emacs23-lucid
#endif

#if DISTRIBUTION jessie stretch
hyphen-ru
emacs24-lucid
#endif

#if DISTRIBUTION jessie stretch
i3blocks
openbox-menu
#endif

xscreensaver
xscreensaver-data-extra
xscreensaver-gl
xscreensaver-gl-extra
libreoffice
libreoffice-l10n-ru
libreoffice-help-ru
haskell-mode
ocaml-mode
js2-mode
lua-mode
org-mode
python-mode
sml-mode

xli
xloadimage
alsamixergui
wmctrl
tint2
lxrandr
lxpolkit
awesome
awesome-extra
fbreader
fbautostart
fbpager

# сканирование
sane
sane-utils

# дополнения для f >=60 либо не готовы,
# либо не поддерживаются.
firefox-esr
firefox-esr-l10n-all
#icedtea-plugin
#xul-ext-adblock-plus
#xul-ext-noscript
#xul-ext-stylish
#drweb-esuite-plugins

thunderbird
thunderbird-l10n-all

chromium
chromium-l10n
#if DISTRIBUTION stretch
chromium-widevine
#endif

# annex

flash-plugin
flash-player-ppapi
libgtk2.0-0
