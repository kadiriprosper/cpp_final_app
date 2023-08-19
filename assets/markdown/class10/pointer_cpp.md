- **Definition**
1. It is a special type of variable which is used to store the address of another variable
2. It can store the address of same data types (i.e an integer pointer can store the address of integer variable, character pointer can store the address of character variable and so on)
3. If we add asterik(*) symbol with anny variable at the time of dclaring variable, then this variable is called "pointer variable"
4. We use ampersand symbol to get the address of variable
5. * symbol is used to get the value at address which is hold by pointer


<br>
<div align="center">
<img src="../imgs/C++/img28.jpg" height="60%" width="60%">
</div>
<br>

- **Syntax**

1. Here 'a' is a normal variable
2. 'p' is apointer variable because it is associated with * symbol


<br>

- **Example**

```

#include<iostream.h>
int main()
{
    int a=10; 	// initializing normal variable
    int *p; 	// declaring pointer variable
    p=&a; 	// address of variable a is assigned to p
    cout<<"value of a="<<a;
    cout<<"address of a="<<&a;
    cout<<"value of p="<<p;
    cout<<"address of p="<<&p;
    cout<<"value of *p="<<*P; 
}


/*
### Output ###
value of a=10
address of a=8284
value of p=8284
address of p=8288
value of *p=10

*/


```

- **Output Explanation**
Assume that the addres of variable a is 8284 and address of variable p is 8288, it may be different in your system

    <br>
    <div align="center">
    <img src="../imgs/C++/img29.jpg" height="60%" width="60%">
    </div>
    <br>


<a href="##">Click for Practical Program</a>
