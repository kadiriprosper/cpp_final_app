## Union

### Definition

1. It is a collection of data of different data type
2. It is a user define data type
3. Data can be of `int, char, float, double` etc data type
4. We can access the member of union by making the variable of union
5. `union` keyword is used to create a union
6. Note: Union does not support multiple value simultaneously. <br> It can only store one value at a time.


### Syntax

![](resource:assets/images/C/img-b35.png)

### Example:

```
union student
{
	char name[200];
	int rollno;
	float marks;
};
```

Here: 
1. student is the name of union
2. union is a keyword

### Declaration of Union Variable (method 1)
```
union student
{
	char name[200];
	int rollno;
	float marks;
};
int main()
{
	union student student1;


	return 0;
}

```
Here student1 is variable of union

### Example:- Write a program to store and display the student name, rollno and marks

Note: 
- Union will show only one last value correct cause it can store only single value at a time
- I am writing this program here so you can understsand difference b/w structure and union better


```
#include <stdio.h>
#include <string.h>
union student
{
	char name[200];
	int rollno;
	float marks;
};
int main()
{
	union student student1; 	// declaring structure variable
	strcpy(student1.name,"Nemo");
	student1.rollno=201;
	student1.marks=85.9;
		printf("Student Name=%s\n",student1.name);
		printf("Student Rollno=%d\n",student1.rollno);
		printf("Student Marks=%f\n",student1.marks);
}


### output ###
Student Name=garbage value
Student Rollno=garbage value
Student Marks=85.9

```

<a href="##">Click for Practical Program</a>