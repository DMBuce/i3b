#SHELL = /bin/sh

# root for installation
prefix      = /usr/local
exec_prefix = ${prefix}

## executables
bindir     = ${exec_prefix}/bin
#sbindir    = ${exec_prefix}/sbin
#libexecdir = ${exec_prefix}/libexec
#
## data
datarootdir    = ${prefix}/share
#datadir        = ${datarootdir}
sysconfdir     = ${prefix}/etc
#sharedstatedir = ${prefix}/com
#localstatedir  = ${prefix}/var
#
## misc
#includedir    = ${prefix}/include
#oldincludedir = /usr/include
#docdir        = ${datarootdir}/doc/${PACKAGE_TARNAME}
#infodir       = ${datarootdir}/info
#libdir        = ${exec_prefix}/lib
#localedir     = ${datarootdir}/locale
mandir        = ${datarootdir}/man
man1dir       = $(mandir)/man1
#man2dir       = $(mandir)/man2
#man3dir       = $(mandir)/man3
#man4dir       = $(mandir)/man4
#man5dir       = $(mandir)/man5
#man6dir       = $(mandir)/man6
#man7dir       = $(mandir)/man7
#man8dir       = $(mandir)/man8
#man9dir       = $(mandir)/man9
#manext        = .1
#srcdir        = .

INSTALL         = /usr/bin/install -c -D
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644

PACKAGE   = i3b
PROG      = i3b
#VERSION   = 0.0.0
BUGREPORT = https://github.com/DMBuce/i3b/issues
URL       = https://github.com/DMBuce/i3b

BINFILES          = $(wildcard bin/*)
#ETCFILES          = $(shell find config/ -type f)
MAN1FILES         = doc/i3move.1
HTMLFILES         = $(BINFILES:bin/%.1=doc/%.html)
TEXTFILES         = $(BINFILES:bin/%.1=doc/%.txt)
MANFILES          = $(MAN1FILES)
DOCFILES          = $(MANFILES) $(HTMLFILES) $(TEXTFILES)
BINFILES_INSTALL  = $(BINFILES:bin/%=$(DESTDIR)$(bindir)/%)
MAN1FILES_INSTALL = $(MAN1FILES:doc/%=$(DESTDIR)$(man1dir)/%)
MANFILES_INSTALL  = $(MAN1FILES_INSTALL)
#ETCFILES_INSTALL  = $(ETCFILES:config/%=$(DESTDIR)$(sysconfdir)/%)
INSTALL_FILES     = $(BINFILES_INSTALL) $(ETCFILES_INSTALL) $(MANFILES)
INSTALL_DIRS      = $(sort $(dir $(INSTALL_FILES)))

.PHONY: all
all: doc

.PHONY: doc
doc: $(DOCFILES)

doc/%.1: bin/%
	mkdir -p doc
	pod2man $< > $@

doc/%.txt: bin/%
	mkdir -p doc
	pod2text $< > $@

doc/%.html: bin/%
	mkdir -p doc
	pod2html $< > $@

.PHONY: install
install: all installdirs $(INSTALL_FILES)

.PHONY: installdirs
installdirs: $(INSTALL_DIRS)

$(INSTALL_DIRS):
	$(INSTALL) -d $@

$(DESTDIR)$(bindir)/%: bin/%
	$(INSTALL_PROGRAM) $< $@

$(DESTDIR)$(man1dir)/%: doc/%
	$(INSTALL_DATA) $< $@

$(DESTDIR)$(sysconfdir)/%: config/%
	$(INSTALL_DATA) $< $@

# vim: set ft=make:
