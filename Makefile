NAME := wine
SPEC := $(NAME)/$(NAME).spec
DIST := dist
SRCS := $(DIST)/SOURCES

rpm: clean
	git submodule init
	git submodule update
	mkdir -p $(DIST)/{BUILD,BUILDROOT,RPMS,SPECS,SOURCES,SRPMS}
	spectool -g -A -f -C $(SRCS) $(SPEC) # https://stackoverflow.com/a/33177482
	cp -f $(NAME)/* $(SRCS)
	rpmbuild -ba \
		--define "_topdir $(PWD)/$(DIST)" \
		$(SPEC)

lint:
	rpmlint $(SPEC)

clean:
	rm -rf $(DIST)

install:
	sudo dnf install `find $(DIST)/RPMS/ -iname *.rpm`
