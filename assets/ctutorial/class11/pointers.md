## Pointer in C

### Definition
1. It is a special type of variable which is used to store the address of another variable
2. It can store the address of same data types (i.e an integer pointer can store the address of integer variable, character pointer can store the address of character variable and so on)
3. If we add asterik(*) symbol with anny variable at the time of dclaring variable, then this variable is called "pointer variable"
4. We use ampersand symbol to get the address of variable
5. \* symbol is used to get the value at address which is hold by pointer

![](resource:assets/images/C/img-b24.png)

### Syntax

1. Here 'a' is a normal variable
2. 'p' is apointer variable because it is associated with * symbol

### Example

```
#include<stdio.h>
int main()
{
	int a=10; 	// initializing normal variable
	int *p; 	// declaring pointer variable
	p=&a; 	// address of variable a is assigned to p
	printf("value of a=%d\n",a);
	printf("address of a=%d\n",&a);
	printf("value of p=%d\n",p);
	printf("address of p=%d\n",&p);
	printf("value of *p=%d\n",*P); 
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

### Output Explanation
Assume that the addres of variable a is 8284 and address of variable p is 8288, it may be different in your system
	
![](resource:assets/images/C/img-b25.png)

<a href="##">Click for Practical Program</a>