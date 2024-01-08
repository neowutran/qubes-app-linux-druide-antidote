PANDOC=pandoc -s -f markdown -t man
VERSION := $(shell cat version)
NAME := $(shell ./vars.sh name)
NAME_CAMEL := $(shell ./vars.sh camelname)

qvm-$(NAME).1: README.md
	$(PANDOC) $< > $@

qvm-$(NAME).1.gz: qvm-$(NAME).1
	gzip -f $<

manpage: qvm-$(NAME).1.gz

install-dom0:
	install -D -m 0664 policy /etc/qubes/policy.d/80-${NAME_CAMEL}.policy

install-vm: install-vm-client install-vm-server

install-vm-common:
		install -d $(DESTDIR)/usr/lib/qubes

install-vm-server: install-vm-common
	install -D server $(DESTDIR)/usr/lib/qubes/$(NAME)-server
	install -d $(DESTDIR)/etc/qubes-rpc
	ln -s ../../usr/lib/qubes/$(NAME)-server $(DESTDIR)/etc/qubes-rpc/qubes.$(NAME_CAMEL)

install-vm-client: manpage install-vm-common
	install -d $(DESTDIR)/usr/share/man/man1
	install -D qvm-$(NAME).1.gz $(DESTDIR)/usr/share/man/man1/
	install -D qvm $(DESTDIR)/usr/bin/qvm-$(NAME)
	install -D client $(DESTDIR)/usr/lib/qubes/$(NAME)-client

clean:
	rm -f qvm-$(NAME).1.gz
