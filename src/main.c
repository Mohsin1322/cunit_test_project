#include <stdio.h>
#include "calculator.h"

int main() {
    printf("Calculator Demo\n");
    printf("2 + 3 = %d\n", add(2, 3));
    printf("5 - 2 = %d\n", subtract(5, 2));
    printf("4 * 3 = %d\n", multiply(4, 3));
    printf("10 / 2 = %d\n", divide(10, 2));
    
    return 0;
}
