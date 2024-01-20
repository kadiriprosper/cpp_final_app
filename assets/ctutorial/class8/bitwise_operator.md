### Bitwise Operators

![](resource:assets/images/C/img-b11.png)

```
#include<stdio.h>
int main()
{
	int a=5,b=3,c; 	// variable declaration
	c=a&b; 	 	// AND operation
	printf("a&b=%d\n",c);
	c=a|b; 	 	// OR operation
	printf("a|b=%d\n",c);
	c=a>>2; 	 	// shift right operation
	printf("a>>2=%d\n",c);
	c=a<<2; 	 	// shift center operation
	printf("a<<2=%d\n",c);
	
}

/*
### Output ###
a&b=1
a|b=7
a>>2=1
a<<2=20
*/
```

