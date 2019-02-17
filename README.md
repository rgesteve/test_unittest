# Basic gtest-based unit testing driven by CMake

A skeletal project testing how to use `gtest`, `cmake`, `vcpkg` and
`docker` multi-stage builds in a cross-plat setting.

To build, run
```
docker build -t <image_name> [-f Dockerfile.win] .
```
and then
```
docker run -it [--rm] <image_name> {cmd.exe,/bin/bash}
```
Once running within the container, either interactively or using `docker exec`, you can configure the build using:
```
mkdir build && cd build
cmake -DCMAKE_TOOLCHAIN_FILE=[vcpkg root]\scripts\buildsystems\vcpkg.cmake ..\src
```
