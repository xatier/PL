#include <stdio.h>

int odd(int);

int even (int n) {
    if (n == 0)
        return 1;
    else
        return odd(n-1);
}

int odd (int n) {
    if (n == 0)
        return 0;
    else
        return even(n-1);
}

int main (void) {
    printf("%d", even(3));
    return 0;
}



+---+
|n=0| odd
+---+ <-----+
|n=1| even -+
+---+ <-----+
|n=2|  odd -+
+---+ <-----+
|n=3| even -+
+---+

+----------------------+
| e(3) o(2) e(1) o(0)  |
+----------------------+
