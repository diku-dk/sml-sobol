SMLPKG ?= smlpkg

.PHONY: all
all: lib/github.com/diku-dk/sml-sobol
	$(MAKE) -C lib/github.com/diku-dk/sml-sobol all

.PHONY: test
test: lib/github.com/diku-dk/sml-sobol
	$(MAKE) -C lib/github.com/diku-dk/sml-sobol test

.PHONY: clean
clean:
	$(MAKE) -C lib/github.com/diku-dk/sml-sobol clean
	rm -rf MLB *~ .*~

.PHONY: realclean
realclean:
	$(MAKE) clean
	rm -rf lib/github.com/diku-dk/sml-sobol

lib/github.com/diku-dk/sml-sobol:
	$(SMLPKG) sync
