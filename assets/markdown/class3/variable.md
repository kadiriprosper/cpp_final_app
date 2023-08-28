## Definition
1. It is a name of storage space which is used to store data
2. It's value is changable
3. It always contains last value stored to it
4. It's always declare with data type

- In C++, there are different types of variables (defined with different keywords), for example:

* `int` - stores integers (whole numbers), without decimals, such as 123 or -123
* `double` - stores floating point numbers, with decimals, such as 19.99 or -19.99
* `char` - stores single characters, such as 'a' or 'B'. Char values are surrounded by single quotes
* `string` - stores text, such as "Hello World". String values are surrounded by double quotes
* `bool` - stores values with two states: true or false

### Varable Declaration

```
    int rollno;
    float marks;
    char grade;

```

**Here:**
- rollno is a variable of type int
- marks is a variable of type float
- grade is a variable of type char

### Variable Initialization

```
    int rollno=201
    float marks=85.6
    char grade='A'

```

**Here:**
- 201 is the value of rollno
- 85.6 is the value of marks
- A is the value of grade (Character value is always written in single quotes)

### Rules to declare a variable
1. The first letter of a variable should be alphabet or underscore(_)
2. The first letter of a variable should not be digit
3. After first character it may be combination of alphabets and digits
4. Blank space are not allowed in variable name 
5. Variable name should not be a keyword 


### To create a variable, specify the type and assign it a value:

`type variableName = value;`

**Note:** Where `type` is one of C++ types (such as `int`), and `variableName` is the name of the variable (such as x or myName). The equal sign is used to assign values to the variable.

### Example 1

Create a variable called x of type int and assign it the value 15:
 
```
    #include <iostream>
    using namespace std;

    int main() {
        int myNum = 15;
        cout << myNum;
        return 0;
    }
```
