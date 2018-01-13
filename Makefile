#
# Versions
#

VERSION := 2.20
RELEASE := 1

i386_RPM   := i386/wine-$(VERSION)-$(RELEASE).i386.rpm
x86_64_RPM := x86_64/wine-$(VERSION)-$(RELEASE).x86_64.rpm
SRPM       := wine-$(VERSION)-$(RELEASE).src.rpm

TARGETS    := $(i386_RPM) $(x86_64_RPM) $(SRPM)

#
# Upstream checks
#

#
# PHONY targets
#

.PHONY: all rpm srpm devel rawhide clean clean-rawhide clean-mainline clean-all versions

all: $(TARGETS)

rpm: $(i386_RPM) $(x86_64_RPM)

srpm: $(SRPM)

clean:
	rm -rf $(TARGETS) $(EVDI_DEVEL) $(EVDI_PKG)

BUILD_DEFINES =                                                     \
    --define "_topdir `pwd`"                                        \
    --define "_sourcedir `pwd`"                                     \
    --define "_rpmdir `pwd`"                                        \
    --define "_specdir `pwd`"                                       \
    --define "_srcrpmdir `pwd`"                                     \
    --define "_buildrootdir `mktemp -d /tmp/winetmpXXXXXX`"         \
    --define "_builddir `mktemp -d /tmp/winetmpXXXXXX`"             \
    --define "_tmppath `mktemp -d /tmp/winetmpXXXXXX`" 

$(i386_RPM): $(BUILD_DEPS)
	rpmbuild -bb $(BUILD_DEFINES) wine.spec --target=i386

$(x86_64_RPM): $(BUILD_DEPS)
	rpmbuild -bb $(BUILD_DEFINES) wine.spec --target=x86_64

$(SRPM): $(BUILD_DEPS)
	rpmbuild -bs $(BUILD_DEFINES) wine.spec
