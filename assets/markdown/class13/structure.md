## Definition

1. It is a collection of data of different data type
2. It is a user define data type
3. Data can be of `int, char, float, double` etc data type
4. We can access the member of structure by making the variable of structure
5. `struct` keyword is used to create a structure


### **Syntax**

![Syntax](../imgs/C++/img39.jpg)

### **Example:**

```
    struct student
    {
        char name[200];
        int rollno;
        float marks;
    };

```

**Here:**
1. student is the name of structure
2. struct is a keyword


### Example:

**Write a program to store and display the student name, rollno and marks**


```

    #include <iostream.h>
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
            cout<<"Student Name="<<student1.name<<"\n";
            cout<<"Student Rollno="<<student1.rollno<<"\n";
            cout<<"Student Marks="<<student1.marks<<"\n";
    }


    ### output ###
    Student Name=Nemo
    Student Rollno=201
    Student Marks=85.9

```
<!-- <a href="##">Click for Practical Program</a> -->