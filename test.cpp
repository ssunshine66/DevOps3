#include <iostream>
#include <vector>
#include <algorithm>
#include <chrono>
#include <cassert>
#include "func.h"

int main() {
    TrigFunc tf;
    auto start = std::chrono::high_resolution_clock::now();

    std::vector<double> values;
    for (int i = 0; i < 1000000; ++i) {
        values.push_back(tf.FuncA(0.5, 10));
    }

    std::sort(values.begin(), values.end());

    auto end = std::chrono::high_resolution_clock::now();
    double time = std::chrono::duration<double>(end - start).count();

    std::cout << "Elapsed time: " << time << " seconds\n";

    assert(time >= 5.0 && time <= 20.0);

    return 0;
}
