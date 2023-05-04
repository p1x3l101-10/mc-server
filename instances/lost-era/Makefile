MODRINTH_PACK_SLUG = "p87Jiw2q"
PREFIX = $(shell pwd -P)
LIBDIR = "../../lib"
export $(PREFIX)
export $(LIBDIR)
BUILDCONF = "./build.conf"
MC_VERS = $(shell $(LIBDIR)/modrinth/pack-mc-ver.sh $(MODRINTH_PACK_SLUG))
MODLOADER = $(shell $(LIBDIR)/modrinth/pack-modloader.sh $(MODRINTH_PACK_SLUG))

all: download overrides

fresh: clean all

clean:
	rm -r data
	rm -r config
	rm -r mods
	rm overrides.yml

download:
	$(LIBDIR)/modrinth/dl-pack.sh $(MODRINTH_PACK_SLUG)

overrides:
	bash -c 'env PREFIX=$(PREFIX) MC_VERS=$(MC_VERS) MODLOADER=$(MODLOADER) $(LIBDIR)/fileTools/overrides.sh $(shell cat $(BUILDCONF))'
