# категории пакетов:
#   - минимальный (всё для работы терм.клиентов + lightdm + ssh)
#   - базовый (основные настройки для работы)
#   - аварийный (пакеты для аварийного восстановления)
#   - терминал (rdp, ica ...)
#   - проигрыватели (xine, mplayer, xbmc ...)
#   - разработка (компиляторы ...)
#   - интернет (iceweasel, googleearth, chrome ...)
#   - игры (freeciv, openarena, quake3 ...)
#
# возможность сборки с разными категориями пакетов.
#
# возможность сборки x86 и x64.
#
# два режима запуска: xorg и console.
#
# vboxmanage convertfromraw \
#   server-20160916-i386.hybrid.iso \
#   server-20160916-i386.hybrid.vmdk \
#   --format VMDK --variant Fixed
#
# qemu-img convert -O vmdk -o subformat=monolithicFlat,adapter_type=lsilogic \
#   server-20160916-i386.hybrid.iso server-20160916-i386.vmdk 
#
# Переменные для makefile:
#   arch   = i386 | amd64
#   distr  = | stretch | buster | sid | ...
#   repo   = local | net | inet
#   suffix = name - "2018q1"
#   linux  = kernel_version - "-4.9.0-0.bpo.5"

user_name=$(shell id -un)
group_name=$(shell id -gn)

# arch - используемая архитектура.
ifdef arch
	architecture=$(arch)
else
	architecture=amd64
endif

# distr - используемый дистрибутив.
ifdef distr
	distribution=$(distr)
else
	distribution=buster
endif
annex_repo="deb http://localhost:8080 $(distribution) annex"
google_repo="deb http://dl.google.com/linux/earth/deb/ stable main"
multimedia_repo="deb http://www.deb-multimedia.org $(distribution) main non-free"

overlay_fs=overlay
ifeq ($(distribution), jessie)
	overlay_fs=aufs
endif
ifeq ($(distribution), wheezy)
	overlay_fs=aufs
endif

# updates
ifeq ($(distribution), sid)
    updates=false
else
    updates=true
endif

# repo - используемый репозитарий пакетов.
ifndef repo
	repo=inet
endif

repository=$(repo)
ifeq ($(repo), net)
	repository="http://s75ocs01.chel.cbr.ru/debian"
endif
ifeq ($(repo), local)
	repository="http://localhost:8080"
endif
ifeq ($(repo), inet)
	repository="http://ftp.debian.org/debian"
endif

# suffix - часть имени образа.
ifdef suffix
	image_suffix=$(suffix)
else
	image_suffix=$(shell date "+%Y%m%d")
endif

# linux - используемая версия ядра linux.
linux="-4.19.98-noerror"
ifdef linux
    linux_packages="linux-image$(linux)"
endif
ifndef linux_packages
    linux_packages="linux-image-4.19.98-noerror"
endif

#ifeq ($(architecture), i386)
#	linux_flavours="686-pae"
#else
#	linux_flavours="$(architecture)"
#endif

# live_volume
live_volume=l$(shell date "+%Y%m%d%H%S")

.PHONY : all clean clean-all iso hdd net configure build install install-desktop install-rescue annex

all:
	@echo "Использование:"
	@echo "  make rescue-net,  make rescue-iso,"
	@echo "  make desktop-net, make desktop-iso,"
	@echo "  make server-iso,  make server-hdd,"
	@echo "  make live-iso,    make live-hdd,"
	@echo "  make xen-iso,     make xen-hdd"
	@echo
	@echo "Переменные:"
	@echo "  arch   - используемая архитектура"
	@echo "  distr  - используемый дистрибутив"
	@echo "  repo   - используемый репозитарий пакетов"
	@echo "  suffix - часть имени образа"
	@echo "  linux  - используемая версия ядра linux"

boot_append=boot=live components nosplash nonetworking ip= nofstab live-media=/dev/disk/by-label/$(live_volume) acpi_backlight=vendor
boot_append_failsafe=boot=live components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal nofstab live-media=/dev/disk/by-label/$(live_volume)

netboot_base=~/.fs/netboot/netboot
reminst_base=~/.fs/netboot/reminst

install-rescue rescue-iso rescue-net: image_name = rescue
rescue-iso rescue-net: boot_append += nopersistence 2
rescue-iso rescue-net: boot_append_failsafe += nopersistence 2
rescue-iso rescue-net: LB_TASK ?= rescue

install-desktop desktop-iso desktop-net: image_name=desktop
desktop-iso desktop-net: boot_append+=persistence persistence-label=org-persistence
desktop-iso desktop-net: boot_append_failsafe+=persistence persistence-label=org-persistence
desktop-iso desktop-net: LB_TASK ?= gdata esk

server-iso server-hdd: image_name=server
server-iso server-hdd: boot_append+=persistence persistence-label=srv-persistence 2
server-iso server-hdd: boot_append_failsafe+=persistence persistence-label=srv-persistence 2
server-iso server-hdd: LB_TASK ?= esk

xen-iso xen-hdd: image_name=xen
xen-iso xen-hdd: boot_append+=persistence  persistence-label=srv-persistence
xen-iso xen-hdd: boot_append_failsafe+=persistence  persistence-label=srv-persistence

live-iso live-hdd: image_name=live
live-iso live-hdd: boot_append+=persistence persistence-label=xx-persistence
live-iso live-hdd: boot_append_failsafe+=persistence persistence-label=xx-persistence
live-iso live-hdd: LB_TASK ?= gdata

rescue-iso desktop-iso server-iso live-iso xen-iso: iso
rescue-net desktop-net server-net live-net: net
server-hdd live-hdd xen-hdd: hdd

install .build/binary_iso .build/binary_netboot .build/binary_hdd: build_image_name=$(if $(image_name),$(image_name),debian-live)

iso: image_type=iso-hybrid
iso: .build/binary_iso

hdd: image_type=hdd
hdd: .build/binary_hdd

net: image_type=netboot
net: .build/binary_netboot

.build/binary_iso .build/binary_netboot .build/binary_hdd: .build/config
	@sudo LB_TASK="$(LB_TASK)" lb build
	@sudo find binary -type d -exec chmod a+rx {} \;
	@sudo find binary -type f -exec chmod a+r {} \;
	@sudo chmod a+r $(build_image_name)-$(image_suffix)-$(architecture).*
	@sudo chown $(user_name):$(group_name) $(build_image_name)-$(image_suffix)-$(architecture).*
	@sudo touch -m $(build_image_name)-$(image_suffix)-$(architecture).*

annex:
	@echo $(annex_repo) > config/archives/annex.list.chroot
	@echo $(google_repo) > config/archives/google-earth.list.chroot
	@echo $(multimedia_repo) > config/archives/debian-multimedia.list.chroot

.build/config: annex
	@m4 -I config/package-lists config/package-lists/task-$(build_image_name).m4 > config/package-lists/live.list.chroot
	lb config \
	--binary-images $(image_type) \
	--distribution $(distribution) \
	--parent-distribution $(distribution) \
	--parent-mirror-bootstrap $(repository) \
	--updates $(updates) \
	--linux-packages=$(linux_packages) \
	--architecture $(architecture) \
	--bootappend-live "$(boot_append) union=$(overlay_fs)" \
	--bootappend-live-failsafe "$(boot_append_failsafe) union=$(overlay_fs)" \
	--image-name "$(build_image_name)-$(image_suffix)" \
	--iso-volume "$(live_volume)" \
	--hdd-label "$(live_volume)"

clean-all: clean
	@sudo lb clean --cache

clean:
	@sudo lb clean
	@if [ -d chroot.rescue ]; then sudo rm -rf chroot.rescue; fi
	@if [ -d chroot.esk ];    then sudo rm -rf chroot.esk; fi
	@if [ -d chroot.gdata ];  then sudo rm -rf chroot.gdata; fi
	@if [ -d chroot.test ];   then sudo rm -rf chroot.test; fi
	@rm -rf .build
	@if [ -f config/build ];                                  then rm -f config/build; fi
	@if [ -f config/package-lists/live.list.chroot ];         then rm -f config/package-lists/live.list.chroot; fi
	@if [ -f config/archives/annex.list.chroot ];             then rm -f config/archives/annex.list.chroot; fi
	@if [ -f config/archives/google-earth.list.chroot ];      then rm -f config/archives/google-earth.list.chroot; fi
	@if [ -f config/archives/debian-multimedia.list.chroot ]; then rm -f config/archives/debian-multimedia.list.chroot; fi

install:
	mkdir -p $(image_path)
	mkdir -p $(kernel_path)
	rm -rf $(image_path)/*
	tar -C $(image_path) -f $(build_image_name)-$(image_suffix)-$(architecture).netboot.tar --strip-components 2 -x debian-live/live
	rm -rf $(image_path)/*.packages*
	rm -rf $(image_path)/memtest
	tar -C $(kernel_path) -f $(build_image_name)-$(image_suffix)-$(architecture).netboot.tar --strip-components 2 --wildcards -x "tftpboot/live/vmlinuz*" "tftpboot/live/initrd*"

install-rescue: image_index=2
install-rescue: image_path=$(netboot_base)/rescue-$(image_index)/live
install-rescue: kernel_path=$(reminst_base)/rescue-$(image_index)
install-rescue: install

install-desktop: image_index=1
install-desktop: image_path=$(netboot_base)/desktop-$(image_index)/live
install-desktop: kernel_path=$(reminst_base)/desktop-$(image_index)
install-desktop: install
