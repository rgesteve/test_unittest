#include <vector>
#include "sum_integers.hpp"

using namespace std;

int sum_integers(const vector<int> integers) {
  auto sum = 0;
  for (auto i : integers) {
    sum += i;
  }
  return sum;
}
