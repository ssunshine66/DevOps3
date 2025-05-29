#include "func.h"
#include <cassert>
#include <iostream>

int main() {
    TrigFunc trig;
    double result = trig.FuncA(1.0, 2); // Виклик твоєї функції
    assert(result != 0); // простий приклад перевірки
    std::cout << "All tests passed.\n";
    return 0;
}
