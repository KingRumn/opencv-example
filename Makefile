# 需要排除的子目录
exclude_dirs := build bin Data

# 深度为1的目录名称
dirs := $(shell find . -maxdepth 1 -type d)
dirs := $(basename $(patsubst ./%,%,$(dirs)))
dirs := $(filter-out $(exclude_dirs),$(dirs))

SUBDIRS := $(dirs)

TOPDIR=$(realpath .)
INSTALLDIR := $(TOPDIR)/bin
BUILDDIR := $(TOPDIR)/build
SRCDIR := $(TOPDIR)

MD := mkdir -p
CMK := cmake
MK := make

all: $(SUBDIRS)

prepare:
	$(MD) $(INSTALLDIR)
	$(MD) $(BUILDDIR)

$(SUBDIRS):prepare
	@echo $@
	$(MD) $(BUILDDIR)/$@
	cd $(BUILDDIR)/$@ && $(CMK) -D CMAKE_INSTALL_PREFIX=$(INSTALLDIR) $(SRCDIR)/$@
	cd $(BUILDDIR)/$@ && $(MK)


