- **Logical Operators**
<!-- 
	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img13.jpg" height="60%" width="60%">
	</div>
	<br> -->
	
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
