cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(test_unittest LANGUAGES CXX)

add_library(sum_integers sum_integers.cpp)

find_package(GTest MODULE REQUIRED)

add_executable(cpp_test test.cpp)
# target_link_libraries(cpp_test sum_integers)
target_link_libraries(cpp_test PRIVATE sum_integers GTest::GTest GTest::Main)

enable_testing()
add_test(NAME cpp_test
  COMMAND $<TARGET_FILE:cpp_test>
)

