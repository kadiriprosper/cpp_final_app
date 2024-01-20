## Assignment Operators
![](resource:assets/images/C++/img14.png)

```
#include<iostream>
using namespace std;
int main()
{
    int x1=5,y1=3;
    x1+=y1; 	// x1=x1+y1
    cout<<"x1="<<x1<<"\n";

    int x2=5,y2=3;
    x2-=y2; 	// x2=x2-y2
    cout<<"x2="<<x2<<"\n";

    int x3=5,y3=3;
    x3*=y3; 	// x3=x3*y3
    cout<<"x3="<<x3<<"\n";

    int x4=5,y4=3;
    x4/=y4; 	// x4=x4/y4
    cout<<"x4="<<x4<<"\n";

    int x5=5,y5=3;
    x5%=y5; 	// x5=x5%y5
    cout<<"x5="<<x5<<"\n";
}

/*
### Output ###
x1=8
x2=2
x3=15
x4=1
x5=2
*/
```
