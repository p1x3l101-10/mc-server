PACK_FILE = "http://192.168.42.6/pack-o-suffering.mrpack"
PACK_TYPE = "modrinth"
PREFIX = $(shell pwd -P)
LIBDIR = "../../lib"
export $(PREFIX)
export $(LIBDIR)
BUILDCONF = "./build.conf"
MC_VERS = "1.18.2"
MODLOADER = "FORGE"

all: download overrides

fresh: clean all

clean:
	$(LIBDIR)/fileTools/clean-rm.sh data
	$(LIBDIR)/fileTools/clean-rm.sh mods
	$(LIBDIR)/fileTools/clean-rm.sh config
	$(LIBDIR)/fileTools/clean-rm.sh overrides.yml

download:
	$(LIBDIR)/extern/dl-pack.sh $(PACK_TYPE) $(PACK_FILE)

overrides:
	bash -c 'env PREFIX=$(PREFIX) MC_VERS=$(MC_VERS) MODLOADER=$(MODLOADER) $(LIBDIR)/fileTools/overrides.sh $(shell cat $(BUILDCONF))'
