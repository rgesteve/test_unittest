message(STATUS "Adding the library target ****")

add_library(sum_integers sum_integers.cpp)

install(TARGETS sum_integers DESTINATION ${TESTUNITTEST_INSTALL_LIB})

# if (TESTUNITTEST_GTESTVCPKG)
#   message(STATUS "**** From VCPKG PREBUILT")
#   find_package(GTest MODULE REQUIRED)
# else()
#   message(STATUS "**** Should be downloading from GTest release page")
#   include(../cmake/external_gtest.cmake)
# endif()

#add_executable(cpp_test test.cpp)
# target_link_libraries(cpp_test sum_integers)

# if (TESTUNITTEST_GTESTVCPKG)
#   target_link_libraries(cpp_test PRIVATE sum_integers GTest::GTest GTest::Main)
# else()
#   target_link_libraries(cpp_test PRIVATE sum_integers libgtest)
# endif()

# enable_testing()
# add_test(NAME cpp_test
#   COMMAND $<TARGET_FILE:cpp_test>
# )
