FROM ubuntu:18.04
# FROM ubuntu:18.04 # as build

LABEL description="Build container -- test_docker_vcpkg"

# Install pre-requisites

RUN apt update && apt install -y --no-install-recommends \
    build-essential ca-certificates cmake \
    curl git tar unzip wget \
    --fix-missing

RUN cd /tmp \
    && git clone https://github.com/Microsoft/vcpkg.git \
    && cd vcpkg \
    && ./bootstrap-vcpkg.sh

# RUN /tmp/vcpkg/vcpkg install gtest protobuf
RUN /tmp/vcpkg/vcpkg install gtest

# Build
# (assumes src has been mounted in /data)
# cmake -DCMAKE_TOOLCHAIN_FILE=/tmp/vcpkg/scripts/buildsystems/vcpkg.cmake ..
