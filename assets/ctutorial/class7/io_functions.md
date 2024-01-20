### Definition
1. There are many predefined function in the library of C
2. `printf` and `scanf` are the predefined function
3. They are common used for input and output
4. `printf` and `scanf` both are predefined in the `stdio.h`
header file

### printf function	
1. It is used to print information or data on to the output screen
2. it is predefined in the `stdio.h` header file
3. `printf` is case sensitive means `Printf` is wrong, so it must be in lowercase

### printf syntax	

printf(format_specifier,variable_name);

example:

```
#include<stdio.h>
int main()
{
	int x=10; 	//x is a variable
	printf("Value of x=%d",x);
}

/*
### Output ###
Value of x=10

*/
```

### scan() function in C

1. it is used to take user input at the time of execution of program
2. it is also predefined in the `stdio.h` header file
3. `scanf` is case sensitive means `Scanf` is wrong, so it must be in lowercase

### scanf synatx

scanf(format_specifier,address of variable);

- example 1: printf and scanf with integer 

```
#include<stdio.h>
int main()
{
	int rollno; 	//declaring integer variable
	printf("Enter your rollno\n");
	scanf("%d",&rollno);
	printf("rollno=%d",rollno);
}

/*
### Output ###
Enter your Rollno
204
rollno=204

*/
```
- example 2: printf and scanf with float 

```
#include<stdio.h>
int main()
{
	float mark; 	//declaring float variable
	printf("Enter your marks\n");
	scanf("%f",&marks);
	printf("marks=%f",marks);
}

/*
### Output ###
Enter your marks
82.3
marks=82.3

*/
```
- example 3: printf and scanf with string 

```
#include<stdio.h>
int main()
{
	char name[50]; 	//declaring character variable
	printf("Enter your name\n");
	scanf("%s",&name);
	printf("name=%s",name);
}

/*
### Output ###
Enter your name
Nemo
name=Nemo

*/
```


