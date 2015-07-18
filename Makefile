#Overridable (You probably want to)
DESTDIR := /
#Overridable
BINDIR := usr/local/bin

default :
	@echo "This program doesn't need building."
	@echo 'Type "make install" to install files to the system.'
	@echo 'Use "DESTDIR" variable to specify your root directory.'
	@echo 'Use "BINDIR" variable to specify where the executable goes.'

install : $(DESTDIR)/usr/share/upstart/sessions/card_parameters_setter.conf $(DESTDIR)/$(BINDIR)/card_parameters_setter

$(DESTDIR)/usr/share/upstart/sessions/card_parameters_setter.conf : card_parameters_setter.conf
	mkdir -p $$(dirname $@)
	cp $< $@

$(DESTDIR)/$(BINDIR)/card_parameters_setter : card_parameters_setter
	mkdir -p $$(dirname $@)
	cp $< $@

.PHONY : default install
