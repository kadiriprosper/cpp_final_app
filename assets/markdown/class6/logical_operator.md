## Logical Operators

![](resource:assets/images/C++/img13.png)
	
```
#include<iostream>
using namespace std;
int main()
{
    int a=10,b=50,c=30;
    if(a>b&&a>c)
    cout<<"a is greater";
    if(b>a&&b>c)
    cout<<"b is greater";
    if(c>a&&c>b)
    cout<<"c is greater";
}

/*
### Output ###
b is greater
*/
```
