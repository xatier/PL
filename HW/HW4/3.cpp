#include <iostream>

using namespace std;

int k;

int f (void) {
    int r = 1;
    for (int i = 2; i <= k; i++)
        r *= i;
    return r;
}

int c (int m, int n) {
    return (k=m, f()) / ( (k=n, f()) * (k=m-n, f()) );
}

int main (void) {
    cout << c(5, 2) << endl;
}

//
// C 語言規範(Annex J)裏面清楚說明 comma operator 的 evaluation 順序是 undefined behavior
// ISO/IEC 9899:201x Committee Draft Annex J, J1 Unspecified behavior
//
// The order in which subexpressions are evaluated and the order in which side effects
// take place, except as speciﬁed for the function-call (), &&, ||, ? :, and comma
// operators (6.5).
//
// 硬要講的話，應該是 2*2*2 = 8 種順序 (一個 comma operator 有兩種)
// 但我仍認為討論這題是沒有意義的
// 
// compiler 按照標準，undefined behavior 可以用任意方式實現，通常 copiler 會找他認為最佳的方式
// 而產生對應的 target code ，討論一個 undefined behavior 的結果同樣也是沒有意義的
//
// clang++ 10
// g++47 0
// VC 0
