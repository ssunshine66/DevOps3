#include <iostream>
#include "func.h"

int main() {
    TrigFunc tf;
    double result = tf.FuncA(0.5, 5);
    std::cout << "Result: " << result << std::endl;
    return 0;
}