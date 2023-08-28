## Bitwise Operators
<!-- 
<br>
<div align="center">
<img src="../imgs/C%2B%2B/img15.jpg" height="60%" width="60%">
</div>
<br>
 -->

```
#include<iostream>
using namespace std;
int main()
{
    int a=5,b=3,c; 	// variable declaration
    c=a&b; 	 	// AND operation
    cout<<"a&b="<<c<<"\n";
    c=a|b; 	 	// OR operation
    cout<<"a|b="<<c<<"\n";
    c=a>>2; 	 	// shift right operation
    cout<<"a>>2="<<c<<"\n";
    c=a<<2; 	 	// shift center operation
    cout<<"a<<2="<<c<<"\n";
    
}

/*
### Output ###
a&b=1
a|b=7
a>>2=1
a<<2=20
*/
```
