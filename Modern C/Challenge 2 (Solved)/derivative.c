#include <math.h>
#include <float.h>
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

double derivative(double x, double func(double x)){
    /* According to wikipedia, to deal with potential rounding errors
    A decent `h` for basic central differences calculation is the 
    cube root of machine epsilon
    Also, just learned that function pointers can be written this way in C
    That's nice
    */
    double h = sqrt(DBL_EPSILON);
    return (func(x+h)-func(x-h))/(2*h);
}

double square(double x) {
    return x*x;
}

double linear(double x) {
    return 2*x;
}

int main(void) {
    assert(fabs(derivative(2.0, square) - 4.0) <= DBL_EPSILON);
    assert(fabs(derivative(2.0, linear) - 2.0) <= DBL_EPSILON);
    assert(fabs(derivative(0, sin) - 1.0) <= DBL_EPSILON);
    assert(fabs(derivative(1, log) - 1.0 <= DBL_EPSILON));
    printf("Test succeeded");
}