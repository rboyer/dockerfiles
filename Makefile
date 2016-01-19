all: steam zookeeper

push:
	git push origin master
	git push house master

steam:
	$(MAKE) -C ./steam

zookeeper:
	$(MAKE) -C ./zookeeper

.PHONY: push steam zookeeper
