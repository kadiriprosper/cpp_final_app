### Assignment Operators

![](resource:assets/images/C/img-b10.png)

```
#include<stdio.h>
int main()
{
	int x1=5,y1=3;
	x1+=y1; 	// x1=x1+y1
	printf("x1=%d\n",x1);

	int x2=5,y2=3;
	x2-=y2; 	// x2=x2-y2
	printf("x2=%d\n",x2);

	int x3=5,y3=3;
	x3*=y3; 	// x3=x3*y3
	printf("x3=%d\n",x3);

	int x4=5,y4=3;
	x4/=y4; 	// x4=x4/y4
	printf("x4=%d\n",x4);

	int x5=5,y5=3;
	x5%=y5; 	// x5=x5%y5
	printf("x5=%d\n",x5);
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

