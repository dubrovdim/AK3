#include "calculator.h"
#include <iostream>

int main() {
    const Calculator calculator;

    std::cout << "2 + 3 = " << calculator.Add(2, 3) << '\n';
    std::cout << "7 - 4 = " << calculator.Sub(7, 4) << '\n';

    return 0;
}
