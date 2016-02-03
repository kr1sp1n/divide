.PHONY: all install

PROJECT  ?= kr1sp1n/divide
TAG      ?= latest

ifdef REGISTRY
	IMAGE=$(REGISTRY)/$(PROJECT):$(TAG)
else
	IMAGE=$(PROJECT):$(TAG)
endif

install: Dockerfile
	$(MAKE) build

build:
	docker build -t $(IMAGE) .
