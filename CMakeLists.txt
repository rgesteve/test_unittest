cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(test_unittest)

if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "In-source builds are not allowed.")
endif()

set(EXTERNAL_INSTALL_DIR ${CMAKE_BINARY_DIR}/external)

if(NOT DEFINED EXTERNAL_PROJECTS_ROOT)
    set(EXTERNAL_PROJECTS_ROOT ${CMAKE_CURRENT_BINARY_DIR})
endif()

# Installation logic
if (LINUX)
    include(GNUInstallDirs)
else()
    set(CMAKE_INSTALL_BINDIR     "bin")
    set(CMAKE_INSTALL_INCLUDEDIR "include")
    set(CMAKE_INSTALL_DOCDIR     "doc")
    set(CMAKE_INSTALL_LIBDIR     "lib")
endif()

# ./CMakeLists.txt:set(NGRAPH_INSTALL_LIB "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}")
set(TESTUNITTEST_INSTALL_LIB "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}")

add_subdirectory(src)

if (NOT TESTUNITTEST_PYBINDINGS_ENABLE)
    message(STATUS "Should be building python bindings!")
    add_subdirectory(python)
else()
    message(STATUS "Won't be building python bindings.")
endif()
