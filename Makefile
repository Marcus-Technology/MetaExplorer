BINDIR ?= /usr/local/bin
LIBDIR ?= /usr/local/lib/metaexplorer
LIBHELPERDIR ?= /usr/local/lib/metaexplorer/helpers

SCRIPTS := mexplore
LIBSCRIPTS := lib/broken_symlink_info.sh lib/file_info.sh lib/folder_info.sh lib/symlink_info.sh
LIBHELPERSCRIPTS := lib/helpers/calculate_file_size.sh

UNINSTALL_SCRIPTS := $(BINDIR)/$(SCRIPTS)
UNINSTALL_LIBSCRIPTS := $(LIBDIR)/broken_symlink_info.sh $(LIBDIR)/file_info.sh $(LIBDIR)/folder_info.sh $(LIBDIR)/symlink_info.sh
UNINSTALL_LIBHELPERSCRIPTS := $(LIBHELPERDIR)/calculate_file_size.sh

root-check:
	@if [ "$$(id -u)" -ne 0 ]; then \
		echo "ERROR: This target must be run as root!"; \
		exit 1; \
	fi

install: root-check
	@echo "Installing MetaExplorer..."
	install -d $(BINDIR)
	install -d $(LIBDIR)
	install -d $(LIBHELPERDIR)
	install -m 755 $(SCRIPTS) $(BINDIR)
	install -m 644 $(LIBSCRIPTS) $(LIBDIR)
	install -m 644 $(LIBHELPERSCRIPTS) $(LIBHELPERDIR)
	@echo "Succesfully installed MetaExplorer!"

uninstall: root-check
	@echo "Uninstalling MetaExplorer..."
	rm -r $(UNINSTALL_LIBHELPERSCRIPTS) $(LIBHELPERDIR)
	rm -r $(UNINSTALL_LIBSCRIPTS) $(LIBDIR)
	rm $(UNINSTALL_SCRIPTS)
	@echo "Succesfully uninstalled MetaExplorer!"

.PHONEY: install uninstall root-check