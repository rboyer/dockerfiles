all: steam

push:
	git push origin master

steam:
	$(MAKE) -C ./steam

.PHONY: push steam
