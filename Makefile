all: steam zookeeper

steam:
	$(MAKE) -C ./steam

zookeeper:
	$(MAKE) -C ./zookeeper

.PHONY: steam zookeeper
