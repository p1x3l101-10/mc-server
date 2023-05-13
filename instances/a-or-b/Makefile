PREFIX = $(shell pwd -P)
LIBDIR = "../../lib"
export $(PREFIX)
export $(LIBDIR)
BUILDCONF = "./build.conf"

all: setup overrides

fresh: clean all

clean:
	rm -r data
	rm overrides.yml

setup:
	mkdir data

overrides:
	bash -c 'env PREFIX=$(PREFIX) $(LIBDIR)/fileTools/overrides.sh $(shell cat $(BUILDCONF))'
