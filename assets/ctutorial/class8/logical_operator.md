### Logical Operators

![](resource:assets/images/C/img-b9.png)

```
#include<stdio.h>
int main()
{
	int a=10,b=50,c=30;
	if(a>b&&a>c)
	printf("a is greater");
	if(b>a&&b>c)
	printf("b is greater");
	if(c>a&&c>b)
	printf("c is greater");
}

/*
### Output ###
b is greater
*/
```

