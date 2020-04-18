# bthandler
# See LICENSE file for copyright and license details.

VERSION = 1.1

# paths
PREFIX = ~/.local/bin/tools

SRC = bthandler
OBJ = $(SRC:.c=.o)

install:
	mkdir -p $(DESTDIR)$(PREFIX)
	cp -f bthandler $(DESTDIR)$(PREFIX)
	chmod 755 $(DESTDIR)$(PREFIX)/bthandler

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bthandler

.PHONY: install uninstall
