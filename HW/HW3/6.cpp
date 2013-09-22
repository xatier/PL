#include <iostream>

using namespace std;

class X {
    public:
        X(int n) : p(new int(n)) { cout << "X(" << *p << ") constructed\n"; }
        X(const X& rhs) : p(new int(*rhs.p)) { cout << "X(" << *p << ") copied\n"; }
        X(X&& rhs) : p(rhs.p) { rhs.p=nullptr; cout << "X(" << *p << ") moved\n";}
        ~X()
        {
            if (p!=nullptr) {
                cout << "X(" << *p << ") destructed\n" << __LINE__;  delete p;
            } else cout << "Moved X object: Nothing to destruct\n";
        }
    private:
        int* p;
};

void q(int n) { if (n>0) throw X(n); }

int p(int n)
{
    try { q(n); }
    catch (int& c) { cout << c; }
    catch (X& c) { p(n-1); }
}

int main() { p(2); }
