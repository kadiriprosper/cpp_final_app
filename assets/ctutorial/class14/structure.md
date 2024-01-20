## Structure

### Definition
1. It is a collection of data of different data type
2. It is a user define data type
3. Data can be of `int, char, float, double` etc data type
4. We can access the member of structure by making the variable of structure
5. `struct` keyword is used to create a structure


### Syntax

![](resource:assets/images/C/img-b34.png)

### Example:

```
struct student
{
	char name[200];
	int rollno;
	float marks;
};

```

Here: 
1. student is the name of structure
2. struct is a keyword


### Declaration of Structure Variable (method 1)

```
struct student
{
	char name[200];
	int rollno;
	float marks;
};
int main()
{
	struct student student1;


	return 0;
}
```

Here, student1 is variable of structure

### Declaration of Structure Variable (method 2)


```
struct student
{
	char name[200];
	int rollno;
	float marks;
}student1;
int main()
{


	return 0;
}
```


### Example:- Write a program to store and display the student name, rollno and marks


```
#include <stdio.h>
#include <string.h>
struct student
{
	char name[200];
	int rollno;
	float marks;
};
int main()
{
	struct student student1; 	// declaring structure variable
	strcpy(student1.name,"Nemo");
	student1.rollno=201;
	student1.marks=85.9;
		printf("Student Name=%s\n",student1.name);
		printf("Student Rollno=%d\n",student1.rollno);
		printf("Student Marks=%f\n",student1.marks);
}


### output ###
Student Name=Nemo
Student Rollno=201
Student Marks=85.9
```

<a href="##">Click for Practical Program</a>