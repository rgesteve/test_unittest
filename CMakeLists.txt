cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(test_unittest LANGUAGES CXX)

add_library(sum_integers sum_integers.cpp)

add_executable(cpp_test test.cpp)
target_link_libraries(cpp_test sum_integers)

enable_testing()
add_test(NAME cpp_test
  COMMAND $<TARGET_FILE:cpp_test>
)

