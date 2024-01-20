##  IF Statement

### Syntax

![](resource:assets/images/C/img-b15.png)

1. If the condition is true its body execute otherwise does not execute
2. In the case of if in the place of condition always zero and non-zero value is checked. 
3. In which zero means condition false and non-zero means condition true.


### Example

```
#include<stdio.h>
#include<conio.h>
int main()
{
	// Assign value to the variable 
	int x=50,y=20;
	// checking the condition
	if(x>y)
	{
		printf("x is greater than y");
	}
}


/*
### Output ###
x is greater than y
*/
```

<a href="##">Click for Practical Program</a>




## IF else statement 

![](resource:assets/images/C/img-b16.png)

### Syntax
1. If the condition is true, 'if' part is executes and if the conditions is false, 'else' part is execute
2. In the case of 'if' in the condition always zero and non-zero value is checked 
3. In which zero means condition false and non-zero means condition true  




### Example


```
#include<stdio.h>
int main()
{
	// Assign value to the variable 
	int x=50,y=20;
	// checking the condition
	if(x==y)
	{
		printf("x is equal to y");
	}
	else
	{
		printf("x is not equal to y");
	}
}


/*
### Output ###
// In the above program condition is 'false' because te value of x=50 and y=20 and they are not equal, so 'else' part will execute

x is not equal to y
*/
```


<a href="##">Click for Practical Program</a>



## IF else ladder statement 



![](resource:assets/images/C/img-b17.png)


### Syntax
1. It is a part of conditional statement that executes only one condition at a time
2. If all condition are false then 'else' part executes
3. It executes that condition that becomes first true from the top
4. In the case of 'if' in the place of condition always zero and non-zero value is checked in which zero means condition 'false' and non-zero means conditon 'true'




### Example


```
#include<stdio.h>
int main()
{
	// Assign value to the variable 
	int x=10;
	if(x>5) 	// checking the condition
	{
		printf("x is greater than 5");
	}
	else if(x<8) 	// checking the condition
	{
		printf("x is less than 8");
	}
	else if(x==10) 	// checking the condition
	{
		printf("x is equal to 10");
	}
	else
	{
		printf("No one condition is true");
	}
}


/*
### Output ###
x is greater than 5
*/
```

Note: As we can see from the above program, there are three conditions in which first and third condition are true but the it executes only one condition that becomes first true from the above so the output is "x is greater than 5" 


<a href="##">Click for Practical Program</a>




## Nested IF


![](resource:assets/images/C/img-b18.png)


### Syntax

1. Nested means "one inside another", so one 'if' inside another 'if' is called 'nested if'
2. In case of 'if' in the place of condition always zero and non-zero value is checked in which zero means condition 'false' and non-zero means condition 'true'


### Example


```
#include<stdio.h>
int main()
{
	// Assign value to the variable 
	int x=10;
	if(x>5) 	// checking the condition
	{
		if(x<15) 	// checking the condition
		{
			printf("x is greater than 5 and less than 15");
		}
	}
	
}


/*
### Output ###
x is greater than 5 and less than 15
*/
```

Note: In the above program the outer 'if' condition is 'true', so it's body will execute and the condition of inner 'if' is also 'true', so the output is "x is greater than 5 and less than 15"

<a href="##">Click for Practical Program</a>

<hr>

<details><summary><b>Switch in C

### Definition

Switch statement allows us to execute one statement from many statement and that statements are called case.

Actually in switch statement, inside the body of switch a number of cases are used and a parameter are passed and from which cas this parameter is matched, executed.  


![](resource:assets/images/C/img-b19.png)


### Syntax

1. IN the switch statement a value/number is passed in the place of parameter and that case will execute which is equal to the value/number.
2. If no case matched with parameter then default case will execute. 


### Example


```
#include<stdio.h>
int main()
{
	// Assigning parameter;s value 
	int p=2;
	switch(p)
	{
		case 1:
		printf("it is case 1");
		break;
		case 2:
		printf("it is case 2");
		break;
		case 3:
		printf("it is case 3");
		break;
		default:
		printf("no case matched");
	}
	return 0;
	
}


/*
### Output ###
it is case 2 	// because p=2 so case 2 will execute
*/
```

<a href="##">Click for Practical Program</a>