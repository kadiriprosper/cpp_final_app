## Definition

1. It is a collection of statement that performs a specific task
2. It execute when it is called by its name
3. A large program is devided into a number of small building block for simplicity and this building block is called function
4. We can call a function again and again
5. The most important features of function is code reusability
6. The C library provides many pre-defined functions 

### Syntax

![](resource:assets/images/C++/img34.png)
![](resource:assets/images/C++/img35.png)


## Key point about the function

- **Function Declaration:** At this stage the function is declared. 

    For example: `void add()`

    
- **Function Definition:** This is the place where actual code is written to perform the task.

    For example


    ```

        void add()
        {
            int x,y=20,z=30;
            x=y+z;
            cout<<"Add="<<x;
        };

    ```



- **Function Calling:** At this stage the function is called.

    For example: `add();`
    


### Complete Example


```

    #include <iostream>
    using namespace std;
    void add(); 	// function declarartion
    void add() 	// function definition
    {
        int x,y=20,z=30;
        x=y+z;
        cout<<"Add="<<x;
    }
    int main()
    {
        add(); 	// function calling
    }


```

## Types of Function

There are two types of function

### Predefined Function

The function which is predefined in the library is called predefined function. 
Example:- `printf(), scanf(), clrscr(), getch()` etc


### Userdefined Function

The function is made by the user is called userdefined function.
Example:- `add(), sub(), multi(). div()` [**Note:**  These are userdefined name, it may different]


### Category of Userdefined Function

There are four categories of userdefined function:

- Function with no return type and no parameter
- Function with no return type and with parameter
- Function with return type and no parameter
- Function with return type and parameter



### **Function with no return type and no parameter**

The function in which there is no value returning by that function is called **Function with no return type and no parameter**

```

    #include<iostream>
    using namespace std;
    void add() 	// function definition
    {
        int x,y=20, z=30;
        x=y+z;
        cout<<"Add="<<x;
    }
    int main()
    {
        add(); 	// function calling
    }


    /*
    ### Output ###
    Add=50
    */

```

In the above example there is no parameter and no return type


### Function with no return type and with parameter

The function in which there is some parameter and there is no value returning by that function is called **Function with no return type and with parameter**


```

    #include<iostream>
    using namespace std;
    void add(int y,int z) 	// function definition
    {
        int x;
        x=y+z;
        cout<<"Add="<<x;
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


In the above example, there are two parameter of "integer" type namely 'y' and 'z' .

There at the time of calling two integer value will be passed in which first will assign to y and second will assign to z.


### Function with return type and with no parameter


The function in which there is no parameter and there is some value returning by that function is called **Function with return type and with no parameter**


```

    #include<iostream>
    using namespace std;
    void add() 	// function definition
    {
        int x,y=20,z=30;
        x=y+z;
        return x;
    }
    int main()
    {
        int rs=add(); 	// function calling
        cout<<"Add="<<rs; 
    }


    /*
    ### Output ###
    Add=50
    */

```


In the above example, there is no parameter but the function will return integer value because there is **int** keyword in the place of return type and return value will assign to variable **rs**.



### Function with return type and with parameter

The function in which there is some parameter and there is some value returning by that function is called **Function with return type and with parameter**


```

    #include<iostream>
    using namespace std;
    void add(int y,int z) 	// function definition
    {
        int x;
        x=y+z;
        return x;
    }
    int main()
    {
        int rs=add(50,30) 	// function calling
        cout<<"Add="<<rs;
    }


    /*
    ### Output ###
    Add=80
    */

```


In the above example, there is no parameter but the function will return integer value because there is **int** keyword in the place of return type and returned value will assign to variables **rs**



## Calling of Function

There are two ways of calling function:

- Call By Value
- Call By Reference


### Call By Value

In this type of calling a function direct value is passed at the time of calling.


```

    #include<iostream>
    using namespace std;
    void add(int y,int z) 	// function definition
    {
        int x;
        x=y+z;
        cout<<"Add="<<x;
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
3. When the address of data is passed at the time of calling so it is neccessary to use **pointer** in the place of parameter.
4. For better understanding, see the example below:-




```

    #include<iostream>
    using namespace std;
    void sum(int *p,int *q) 	// function definition
    {
        int result=*p + *q;
        cout<<"Sum="<<result;
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


In the above example, we can see that **x** and **y** are normal variable and reference of that variables are passed at the time of calling.


### Function with default value

- In this type of function, the functions contains a number of parameter with some initial value 
    **[for example: `void sum(int x=10,int y=20)`]**
- At the etime of calling if there is no value is passed
    **[for example: `sum();`]** 
    then the default value will be x=10 and y=20, but if value passed 
    **[for example: `sum(5,6);`]** 
    then the value will be x=5 and y=6

- For better understanding see the example below:


```

    #include<iostream>
    using namespace std;
    void sum(int x=10,int y=20) 	// function definition
    {
        int result=x + y;
        cout<<"Add="<<result<<"\n";
    }
    int main()
    {
        int x=10, y=20;
        cout<<"Without value\n";
        sum(); 	// function calling without value
        cout<<"With value\n";
        sum(5,6); 	// function calling with value
        
    }


    /*
    ### Output ###
    Without value
    Add=30
    With value
    Add=11
    */

```



## Passing Array to Function

In this type of function, there is an array in the place of parameter
**[for example: `void sum(int ar[5])`]** and its value is passed at the time of calling.


```

    #include<iostream>
    using namespace std;
    void sum(int ar[5]) 	// function definition
    {
        int s=0;
        for(int i=0;i<5;i++)
        s=s+ar[i];
        cout<<"Total suum of element="<<s;
    }
    int main()
    {
        int x[5]={10,20,50,40,60};
        sum(x); 	// function calling with array
        
    }


    /*
    ### Output ###
    Total sum of element=180
    */

```

In the above example, we can see that there is an array **ar[5]** in place of parameter and there as another array **x[5]={10,20,50,40,60}** and it is passed at the etime of calling therefore the value of array x will be copied into array ar.


## Recursion


The process of calling a function by itself is called **Recursion** and the function that calls itself is called **Recursive Function**.


*Factorial of any Number using recursion <br> Factorial of 5=5*4*3*2*1*


```

    #include<iostream>
    using namespace std;
    void factorial(int no,int f) 	// function definition
    {
        if(no>=1)
        {
            f=f*no;
            no--;
            factorial(no,f);
        }
        else
        cout<<"Factorial ="<<f;
    }
    int main()
    {
        int n;
        cout<<"Enter any number to find factorial\n";
        cin>>n;
        factorial(n,1); 	// function calling with array
        
    }


    /*
    ### Output ###
    Enter any number to find factorial
    6
    Factorial =720
    */

```


<!-- <a href="/Simple%20Programs/FUNCTION/Function%20Program%20List.md">Click for Practical Program</a> -->


