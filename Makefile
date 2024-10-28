DESTDIR=/usr/local

.PHONY: install

install:
	install -D -m644 minecraft@.container $(DESTDIR)/share/containers/systemd/minecraft@.container
	install -D -m755 minecraft-setup.bash $(DESTDIR)/lib/systemd/scripts/minecraft
	install -D -m755 minecraft-setDefault.bash $(DESTDIR)/bin/mc-setDefault