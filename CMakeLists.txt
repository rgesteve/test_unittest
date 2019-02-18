cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(test_unittest LANGUAGES CXX)

add_subdirectory(src)

if (TESTUNITTEST_PYBINDINGS_ENABLE)
    message(STATUS "Should be building python bindings!")
    add_subdirectory(python)
else()
    message(STATUS "Won't be building python bindings.")
endif()