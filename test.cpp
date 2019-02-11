#include <vector>

#include "gtest/gtest.h"

#include "sum_integers.hpp"

TEST(One, Simple) {
  auto integers = {1, 2, 3, 4, 5};
  auto sum = sum_integers(integers);

  EXPECT_EQ(15, sum);
}

TEST(One, AlsoSimple) {
  auto integers = {0, 0, 0};
  auto sum = sum_integers(integers);

  EXPECT_EQ(0, sum);
}

int main(int argc, char** argv) {

  ::testing::InitGoogleTest(&argc, argv);

  return RUN_ALL_TESTS();
}
