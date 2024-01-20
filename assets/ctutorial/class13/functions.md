## Functions in C

## Function

### Definition

1. It is a collection of statement that performs a specific task
2. It execute when it is called by its name
3. A large program is devided into a number of small building block for simplicity and this building block is called function
4. We can call a function again and again
5. The most important features of function is code reusability
6. The C library provides many pre-defined functions 
<br>

### Syntax

![](resource:assets/images/C/img-b30.png)


### Key point about the function

![](resource:assets/images/C/img-b31.png)

### Key point about the function

### Function Declaration: At this stage the function is declared. 

For example: `void add()`

	
### Function Definition: This is the place where actual code is written to perform the task.

For example


```
void add()
{
	int x,y=20,z=30;
	x=y+z;
	printf("Add=%d",x);
};

```



### Function Calling: At this stage the function is called.

For example: `add();`
	


### Complete Example


```
#include <stdio.h>
void add(int a,int b); 	// function declarartion
void add(int a,int b) 	// function definition
{
	int c=a+b;
	printf("Add=%d",c);
}
int main()
{
	add(10,20); 	// function calling
}


/* In the above program
10 will assign to variable a 
and 20 will assign to 
variable b so the output is 30.

*/
```

### Types of Function

There are two types of function

### Predefined Function

The function which is predefined in the library is called predefined function. 
Example:- `printf(), scanf(), clrscr(), getch()` etc


### Userdefined Function

The function is made by the user is called userdefined function.
Example:- `add(), sub(), multi(). div()` [Note:  These are userdefined name, it may different]


### Category of Userdefined Function

There are four category of userdefined function:

- Function with no return type and no parameter
- Function with no return type and with parameter
- Function with return type and no parameter
- Function with return type and parameter


### Calling of Function

There are two ways of calling function:

- Call By Value
- Call By Reference


### Call By Value

In this type of calling a function direct value is passed at the time of calling.


```

#include<stdio.h>
void add(int y,int z) 	// function definition
{
	int x;
	x=y+z;
	printf("Add=%d",x);
}
int main()
{
	add(10,20); 	// function calling
}


/*
### Output ###
Add=30
*/

```

In the above example we can see that direct value is passed at the time of calling.


### Call By Reference


1. In ths type of calling a function, the reference of the value is passed at the time of calling
2. Reference is also called address
3. When the address of data is passed at the time of calling so it is neccessary to use pointer in the place of parameter.
4. For better understanding, see the example below:-




```

#include<stdio.h>
void sum(int *p,int *q) 	// function definition
{
	int result=*p + *q;
	printf("Sum=%d",<<result);
}
int main()
{
	int x=10, y=20;
	// reference of variable is get using ampersand(&) operator
	sum(&x,&y); 	// function calling with refrence/address
}


/*
### Output ###
Add=30
*/

```


In the above example, we can see that x and y are normal variable and reference of that variables are passed at the time of calling.



### Recursion


The process of calling a function by itself is called Recursion and the function that calls itself is called Recursive Function.


*Factorial of any Number using recursion <br> Factorial of 5=5*4*3*2*1*


```
#include<stdio.h>
void factorial(int no,int f) 	// function definition
{
	if(no>=1)
	{
		f=f*no;
		no--;
		factorial(no,f);
	}
	else
	printf("Factorial =%d",f);
}
int main()
{
	int n;
	printf("Enter any number to find factorial\n");
	scanf("%d",&n);
)		factorial(n,1); 	// function calling with array
	
}


/*
### Output ###
Enter any number to find factorial
6
Factorial =720
*/
```


<a href="#######">Click for Practical Program</a>

## String Function

### Definition

1. Sring is a collection of character
2. C does not support string data type. Therefore char data type is used to make string
3. String in C is stored in single dimension character array
4. There are many predefined string function in C library
5. All the string functions are predefined in `string.h` header file

![](resource:assets/images/C/img-b32.png)


### strlen(s)

```
#include<stdio.h>
#include<conio.h>
#include<string.h>
int main()
{
	char name[200]="Nemo";
	printf("%d",strlen(name));
	return 0;
}


/*
### Output ###
4 	// because there is 4 character in Easy
*/
```

### strcpy(s1,s2)

```
#include<stdio.h>
#include<conio.h>
#include<string.h>
int main()
{
	char name1[200]="Prosper";
	char name2[200]="Nemo";
	strcpy(name1,name2);
	printf("%s",name1);
	return 0;
}


/*
### Output ###
Nemo
*/

```

### strcmp(s1,s2)


```
#include<stdio.h>
#include<conio.h>
#include<string.h>
int main()
{
	char s1[200]="Nemo";
	char s2[200]="Nemo";
	if(strcmp(s1,s2)==0);
	{
		printf("string s1 and string s2 are same.");
	}
	else
	{
		printf("string s1 and string s2 are not same.");
	}
	return 0;
}


/*
### Output ###
string s1 and string s2 are same.
*/

```

### strcat(s1,s2)


```
#include<stdio.h>
#include<conio.h>
#include<string.h>
int main()
{
	char s1[200]="Easy";
	char s2[200]="Programming";
	printf("%s",strcat(s1,s2));
	return 0;
	
}


/*
### Output ###
Easy Programming
*/

```

### strrev(s)

```
#include<stdio.h>
#include<conio.h>
#include<string.h>
int main()
{
	char s1[200]="ABCD";
	printf("%s",strrev(s));
	return 0;
	
}


/*
### Output ###
DCBA
*/
```

### strupr(s)


```
#include<stdio.h>
#include<conio.h>
#include<string.h>
int main()
{
	char s[200]="Easy";
	printf("%s",strupr(s));
	return 0;
	
}


/*
### Output ###
EASY
*/
```

### strlwr(s)
```
#include<stdio.h>
#include<conio.h>
#include<string.h>
int main()
{
	char s[200]="Easy";
	printf("%s",strlwr(s));
	return 0;
	
}


/*
### Output ###
easy
*/
```

<a href="##">Click for Practical Program</a>

## Math Function

### Definition

1. It is used to perform the mathematical related operation
2. There are many predefined math function in C libray
3. All the math function are predefined in `math.h` header file

![](resource:assets/images/C/img-b33.png)

### Example:

```
#include<stdio.h>
#include<conio.h>
#include<math.h>
int main()
{
	float a=2;
	printf("sin(2)=%f\n",sin(a));
	printf("cos(2)=%f\n",cos(a));
	printf("tan(2)=%f\n",tan(a));
	printf("exp(2)=%f\n",exp(a));	// exponential
	printf("log(2)=%f\n",log(a));	 // natural log
	printf("log10(2)=%f\n",log10(a)); 	// log10
	printf("sqrt(4)=%f\n",sqrt(4)); 	// square root
	printf("cbrt(27)=%f\n",cbrt(27)); 	// cube root
	return 0;
}


/*
### Output ###
sin(2)=0.909
cos(2)=-0.416
tan(2)=-2.185
exp(2)=7.389
log(2)=0.693
log10(2)=0.301
sqrt(4)=2
cbrt(27)=3
*/
```


### floor() function:- It always return minimum round off value

```
#include<stdio.h>
#include<conio.h>
#include<math.h>
int main()
{
	printf("%f\n",floor(2.3));
	printf("%f\n",floor(2.5));
	printf("%f\n",floor(2.8));
	return 0;
}


/*
### Output ###
2.0
2.0
2.0
*/
```



### ceil() function:- It always return maximum round of value

```
#include<stdio.h>
#include<conio.h>
#include<math.h>
int main()
{
	printf("%f\n",ceil(2.3));
	printf("%f\n",ceil(2.5));
	printf("%f\n",ceil(2.8));
	return 0;
}


/*
### Output ###
3.0
3.0
3.0
*/
```



### round() function
```
#include<stdio.h>
#include<conio.h>
#include<math.h>
int main()
{
	printf("%f\n",round(2.3));
	printf("%f\n",round(2.5));
	printf("%f\n",round(2.8));
	return 0;
}


/*
### Output ###
2.0
3.0
3.0
*/
```