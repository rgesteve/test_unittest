cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(test_unittest)

if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "In-source builds are not allowed.")
endif()

set(EXTERNAL_INSTALL_DIR ${CMAKE_BINARY_DIR}/external)

if(NOT DEFINED EXTERNAL_PROJECTS_ROOT)
    set(EXTERNAL_PROJECTS_ROOT ${CMAKE_CURRENT_BINARY_DIR})
endif()

add_subdirectory(src)

if (TESTUNITTEST_PYBINDINGS_ENABLE)
    message(STATUS "Should be building python bindings!")
    add_subdirectory(python)
else()
    message(STATUS "Won't be building python bindings.")
endif()