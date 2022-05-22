
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
#MAN1FILES         = doc/i3move.1
MAN1SRC           = $(wildcard doc/*.1.txt)
MAN1FILES         = $(sort $(BINFILES:bin/%=doc/%.1) $(MAN1SRC:%.txt=%))
MANFILES          = $(MAN1FILES)
HTMLSRC           = $(wildcard doc/*.txt)
HTMLFILES         = $(HTMLSRC:%.txt=%.html)
DOCFILES          = $(MANFILES) $(HTMLFILES)
BINFILES_INSTALL  = $(BINFILES:bin/%=$(DESTDIR)$(bindir)/%)
MANFILES_INSTALL  = $(MANFILES:doc/%=$(DESTDIR)$(man1dir)/%)
#ETCFILES_INSTALL  = $(ETCFILES:config/%=$(DESTDIR)$(sysconfdir)/%)
INSTALL_FILES     = $(BINFILES_INSTALL) $(ETCFILES_INSTALL) $(MANFILES_INSTALL)
INSTALL_DIRS      = $(sort $(dir $(INSTALL_FILES)))

.PHONY: all
all: doc

.PHONY: html
html: $(HTMLFILES)

.PHONY: doc
doc: $(DOCFILES)

%.1: %.1.txt
	asciidoctor -b manpage $<
	# TODO: remove this when everything is converted to asciidoc
	rm -f $@.1

%.html: %.txt
	asciidoc $<
	dos2unix $@

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
