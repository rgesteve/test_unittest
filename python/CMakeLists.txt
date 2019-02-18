cmake_minimum_required(VERSION 3.5)

project(pytestunittest)

message(STATUS "From the python directory ****")

include(ExternalProject)

ExternalProject_Add(
        pybind11
        GIT_REPOSITORY "https://github.com/pybind/pybind11.git"
        GIT_TAG "v2.2.4"
        SOURCE_DIR "${CMAKE_BINARY_DIR}/pybind11"
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
)

set(BUILD_SH_IN "${CMAKE_SOURCE_DIR}/python/build_wheel.sh.in")
set(BUILD_SH    "${CMAKE_BINARY_DIR}/python/build_wheel.sh")
configure_file(${BUILD_SH_IN} ${BUILD_SH} @ONLY)

add_custom_command(
        OUTPUT ${CMAKE_BINARY_DIR}/python/dist/
        POST_BUILD
        WORKING_DIR ${CMAKE_CURRENT_BINARY_DIR}
        COMMAND make -C ../ DESTDIR=python/_install install && bash build_wheel.sh
)

add_custom_target(python_wheel DEPENDS sum_integers ${CMAKE_BINARY_DIR}/python/dist/)
#add_custom_target(python_wheel DEPENDS ${CMAKE_BINARY_DIR}/python/dist/)

#if (NGRAPH_CPU_ENABLE)
#    add_dependencies(python_wheel ext_mkldnn)
#endif()

