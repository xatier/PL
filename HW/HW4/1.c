// Dear TA: compile me with C99(or C11), plz!
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdbool.h>

double max (const char *typestr, double x, ...) {
    va_list vl;
    double max = x;
    va_start(vl, x);
    for (int i = 0; i < (int)strlen(typestr); i++) {
        if (typestr[i] == 'd') {
            int now = va_arg(vl, int);
            max = (double)now > max ? (double)now : max;
        }
        else if (typestr[i] == 'f') {
            double now = va_arg(vl, double);
            max = (double)now > max ? (double)now : max;
        }
        else {
            puts("@@?");
        }
    }
    va_end(vl);
    return max;
}

int main (void) {
    printf("%f", max("ddffddd", 29, 'a', (short)255, 34.56f, 78.9, 254, true, 256));
    return 0;
}
