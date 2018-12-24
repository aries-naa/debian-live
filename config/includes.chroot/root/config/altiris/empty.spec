Summary:		empty rpm package
Name:			empty
%define version 0
Version:		%{version}
Release:		0
#Source:			empty.tar.bz2
License:		none
#Group:			Utilities/Console
#Exclusiveos:		Linux
BuildArchitectures:     noarch
BuildRoot:		/var/tmp/NLS-cyr-linux-root

%description
none

#%package koi8r
#Summary: 		Russian cyrillic NLS koi8-r codepage
#Group:			Utilities/System/NLS

#%description koi8r
#The Russian cyrillic NLS contains rissian keymaps,keytrans and
#locale description for koi8-r codepage.

#%package 8859-5
#Summary: 		Russian cyrillic NLS iso-8859-5 codepage
#Group:			Utilities/System/NLS

#%description 8859-5
#The Russian cyrillic NLS contains rissian keymaps,keytrans and
#locale description for iso-8859-5 codepage.

#%package cp866
#Summary: 		Russian cyrillic NLS cp-866 (MS-DOS) codepage
#Group:			Utilities/System/NLS

#%description cp866
#The Russian cyrillic NLS contains rissian keymaps,keytrans and
#locale description for cp-866 (MS-DOS) codepage.

#%package cp1251
#Summary: 		Russian cyrillic NLS cp-1252 (MS-Windows) codepage
#Group:			Utilities/System/NLS

#%description cp1251
#The Russian cyrillic NLS contains rissian keymaps,keytrans and
#locale description for cp-1252 (MS-Windows) codepage.

%prep
#%setup -n NLS-linux-cyrillic

%build
#make -C keytables
#gzip keytables/*.map
#gzip consoletrans/*.tr
#cd consolefonts
#font2psf  <<..EOF..
#y
#..EOF..
#gzip *.psf
#cd ../i18n/charmaps
#mkdir ../../locale
##for lf in ru_RU.cp866 ru_RU.cp1251 ru_RU.koi8r ru_RU.8859-5 ; do
##    localedef -c -u ../repertoiremaps/mnemonic.ds -f $lf -i ../locales/ru_RU ../.#./locale/$lf
##done

%install
#mkdir -p $RPM_BUILD_ROOT/usr/lib/kbd/consolefonts
#mkdir -p $RPM_BUILD_ROOT/usr/lib/kbd/consoletrans
#mkdir -p $RPM_BUILD_ROOT/usr/lib/kbd/keymaps/i386/qwerty
##mkdir -p $RPM_BUILD_ROOT/usr/share/locale
#cp consolefonts/*.psf.gz $RPM_BUILD_ROOT/usr/lib/kbd/consolefonts
#cp consoletrans/*.tr.gz $RPM_BUILD_ROOT/usr/lib/kbd/consoletrans
#cp keytables/*.map.gz $RPM_BUILD_ROOT/usr/lib/kbd/keymaps/i386/qwerty
##cp -r locale/* $RPM_BUILD_ROOT/usr/share/locale

%clean
rm -rf $RPM_BUILD_ROOT

%files
#%defattr( -, root, root )
#/usr/lib/kbd/consolefonts/*

#%files koi8r
#%defattr( -, root, root )
#/usr/lib/kbd/consoletrans/koi8r.to.cp866.tr.gz
#/usr/lib/kbd/keymaps/i386/qwerty/ru.koi8r.*.map.gz
##/usr/share/locale/ru_RU.koi8r

#%files 8859-5
#%defattr( -, root, root )
#/usr/lib/kbd/consoletrans/8859-5.to.cp866.tr.gz
#/usr/lib/kbd/keymaps/i386/qwerty/ru.8859-5.*.map.gz
##/usr/share/locale/ru_RU.8859-5

#%files cp866
#%defattr( -, root, root )
#/usr/lib/kbd/keymaps/i386/qwerty/ru.cp866.*.map.gz
##/usr/share/locale/ru_RU.cp866

#%files cp1251
#%defattr( -, root, root )
#/usr/lib/kbd/consoletrans/cp1251.to.cp866.tr.gz
#/usr/lib/kbd/keymaps/i386/qwerty/ru.cp1251.*.map.gz
##/usr/share/locale/ru_RU.cp1251
