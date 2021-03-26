

IMAGE_REPO  := bmcclure89/
IMAGE_TAG   := latest
IMAGE       := $(IMAGE_REPO)docker-git-utils:$(IMAGE_TAG)

.PHONY	  : build
build :
	@docker build \
		--tag $(IMAGE) \
		-f Dockerfile.ubuntu .
