#include <iostream>
#include <cstdarg>
using namespace std;

double max(const char* typestr,double x,...)
{
	va_list arg_ptr;
	double m=x;
	va_start(arg_ptr,x);
	while (*typestr!='\0')
		double y;
		switch (*typestr) {
			case 'd': y=va_arg(arg_ptr,int); break;
			case 'f': y=va_arg(arg_ptr,double); break;
		}
		if (y>m) m=y;
		typestr++;
	}
	va_end(arg_ptr);
	return m;	
}	

int main(void) 
{ 
	cout << max("ddffd",29,'a',(short)255,34.56f,78.9,254) << endl;
}

