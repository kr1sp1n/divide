.PHONY: all install

PROJECT  ?= kr1sp1n/divide
TAG      ?= latest

ifdef REGISTRY
	IMAGE=$(REGISTRY)/$(PROJECT):$(TAG)
else
	IMAGE=$(PROJECT):$(TAG)
endif

clean:
	rm -rf vendor/*

install: Dockerfile
	git clone git@github.com:edc/bass.git vendor/bass
	$(MAKE) build

build:
	docker build -t $(IMAGE) .
