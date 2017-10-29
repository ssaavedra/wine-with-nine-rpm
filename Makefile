NAME := wine
DIST := dist
SPEC := $(DIST)/SPECS/$(NAME).spec
SRCS := $(DIST)/SOURCES

rpm: clean helper
	rpmbuild -ba \
		--define "_topdir $(PWD)/$(DIST)" \
		$(SPEC)

srpm: clean helper
	rpmbuild -bs \
		--define "_topdir $(PWD)/$(DIST)" \
		$(SPEC)

prep: clean helper
	rpmbuild -bp \
		--define "_topdir $(PWD)/$(DIST)" \
		$(SPEC)

helper:
	git submodule init
	git submodule update
	mkdir -p $(DIST)/{BUILD,BUILDROOT,RPMS,SPECS,SOURCES,SRPMS}
	patch -p1 $(SPEC) wine.patch
	spectool -g -A -f -C $(SRCS) $(SPEC) # https://stackoverflow.com/a/33177482
	cp -f $(NAME)/* $(SRCS)
	cp -f wine-d3d9-patches/*.patch $(SRCS)

lint:
	rpmlint $(SPEC)

clean:
	rm -rf $(DIST)

install:
	sudo dnf install `find $(DIST)/RPMS/ -iname *.rpm`
