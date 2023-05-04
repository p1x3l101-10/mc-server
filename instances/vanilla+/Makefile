CF_SLUG = 'epoch-runner'
PREFIX = $(shell pwd -P)
LIBDIR = "../../lib"
export $(PREFIX)
export $(LIBDIR)
BUILDCONF = "./build.conf"

all: setup legacy-scripts

fresh: clean all

clean:
	rm -r data
	rm overrides.yml

legacy-scripts:
	./bootstrap.sh
