# Makefile

IMAGE_TAG=multiarch-demo

PLATFORMS=linux/amd64 linux/arm64 darwin/amd64 darwin/arm64 windows/amd64

build:
    @echo "Building for host platform..."
    docker build -t $(IMAGE_TAG) .

linux:
    @echo "Building for Linux..."
    docker build --platform=linux/amd64 -t $(IMAGE_TAG)-linux .

arm:
    @echo "Building for ARM..."
    docker build --platform=linux/arm64 -t $(IMAGE_TAG)-arm .

macos:
    @echo "Building for macOS..."
    docker build --platform=darwin/amd64 -t $(IMAGE_TAG)-macos .

macos-arm:
    @echo "Building for macOS ARM..."
    docker build --platform=darwin/arm64 -t $(IMAGE_TAG)-macos-arm .

windows:
    @echo "Building for Windows..."
    docker build --platform=windows/amd64 -t $(IMAGE_TAG)-windows .

clean:
    @echo "Cleaning up images..."
    -docker rmi $(IMAGE_TAG)
    -docker rmi $(IMAGE_TAG)-linux
    -docker rmi $(IMAGE_TAG)-arm
    -docker rmi $(IMAGE_TAG)-macos
    -docker rmi $(IMAGE_TAG)-macos-arm
    -docker rmi $(IMAGE_TAG)-windows
