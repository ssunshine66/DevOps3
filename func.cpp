#include "func.h"
#include <cmath>
#include <vector>
// Перші числа Ейлера (E_{2n})
static const std::vector<int> eulerNumbers = {1, -1, 5, -61, 1385, -50521};
double TrigFunc::FuncA(double x, int n) {
    double result = 0.0;
    for (int i=0; i < n && i < eulerNumbers.size(); ++i){
        double term = (pow (-1, i) * eulerNumbers[i] * pow(x, 2 * i)) / tgamma(2 * i+1);
        result += term;
    }
    return result;
}