
# root for installation
prefix      = /usr/local
exec_prefix = ${prefix}

bindir     = ${exec_prefix}/bin
datarootdir    = ${prefix}/share
sysconfdir     = ${prefix}/etc
mandir        = ${datarootdir}/man
man1dir       = $(mandir)/man1

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
MANFILES          = $(MAN1FILES)
HTMLFILES         = $(MANFILES:%=%.html)
TEXTFILES         = $(BINFILES:bin/%=doc/%.1.txt)
DOCFILES          = $(MANFILES) $(HTMLFILES) $(TEXTFILES)
BINFILES_INSTALL  = $(BINFILES:bin/%=$(DESTDIR)$(bindir)/%)
MAN1FILES_INSTALL = $(MAN1FILES:doc/%=$(DESTDIR)$(man1dir)/%)
MANFILES_INSTALL  = $(MAN1FILES_INSTALL)
#ETCFILES_INSTALL  = $(ETCFILES:config/%=$(DESTDIR)$(sysconfdir)/%)
INSTALL_FILES     = $(BINFILES_INSTALL) $(ETCFILES_INSTALL) $(MANFILES_INSTALL)
INSTALL_DIRS      = $(sort $(dir $(INSTALL_FILES)))

.PHONY: all
all: doc

.PHONY: html
html: $(HTMLFILES)

.PHONY: text
text: $(TEXTFILES)

.PHONY: doc
doc: $(DOCFILES)

doc/%.1: bin/%
	mkdir -p doc
	pod2man $< > $@

doc/%.1.txt: bin/%
	mkdir -p doc
	pod2text $< > $@ || ./$< --help > $@ 2>&1 || true

doc/%.1.html: bin/%
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
