include .env

ACCESS_TOKEN=
USERNAME=
GIT_REGISTRY=

image:	## build docker image
	docker build -t $(DOCKER_REGISTRY_HOST)/golang-alpine --build-arg access_token="$(ACCESS_TOKEN)" --build-arg username="$(USERNAME)" --build-arg git_registry="$(GIT_REGISTRY)" --squash .