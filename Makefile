.PHONY: build image sign

VERSION ?= $(shell git rev-parse --short HEAD)
IMAGE ?= teleportdan/hello-world:$(VERSION)
OS ?= linux

build:
	GOOS=$(OS) go build -o ./build/fakeservice .

image: build
	docker build -t $(IMAGE) .
	docker push $(IMAGE)

sign:
	cosign sign --yes $(shell docker image inspect $(IMAGE) --format '{{ index .RepoDigests 0 }}')
