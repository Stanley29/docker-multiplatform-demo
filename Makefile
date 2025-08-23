IMAGE_TAG=multiarch-demo

image:
	@echo "Building image for host platform..."
	docker build -t $(IMAGE_TAG) .

linux:
	@echo "Building for Linux..."
	docker build --platform=linux/amd64 -t $(IMAGE_TAG)-linux .

arm:
	@echo "Building for ARM..."
	docker build --platform=linux/arm64 -t $(IMAGE_TAG)-arm .

clean:
	@echo "Cleaning up images..."
	-docker rmi $(IMAGE_TAG)
	-docker rmi $(IMAGE_TAG)-linux
	-docker rmi $(IMAGE_TAG)-arm
