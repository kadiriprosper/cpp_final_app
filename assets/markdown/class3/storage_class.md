## Definition
A storage classes in C++ defines the **scope, lifetime, default initial value** and **storage space** of a variable.

There are four storage classes in C++:
1. automatic
2. static
3. register
4. external

### automatic:storage class
1. Automatic variables are declared inside a function in which they havae to used
2. When the function is called automatic variables are created and destroy when function is exited
3. Automatic variables can nt be used outside that function in which its declared. It means w can say that it is private member
4. Automatic variables are also known as local variable
5. `auto` keyword is usd to declare automatic ttype variable

![](resource:assets/images/C++/img6.png)

### Example

```
    #include<iostream>
    using namespace std;
    int main()
    {
        auto int x=5;
        {
            auto int x=3;
            {
                auto x=1;
                cout<<x<<end1;
            }
            cout<<x<<end1;
        }
        cout<<x<<end1;
    }


    /*
    ### Output ###
    1
    3
    5
    */
```

Here, the value of innermost x is 1, out of this block value is 3 and out of this block is 5.


### static:storage class
1. Static variables can be used anywhere in the program inside or outside of a function or block
2. The value of a static variable exits untill the end of program
3. The satic variable which is declared inside a function is called "internal static variable" and it can not be used outside that function
4. The static variable which is declared outside a function is called external variable" and it can be used in all the function of that program

![](resource:assets/images/C++/img7.png)

### Example

```
    #include<iostream>
    using namespace std;
    void demo()
    {
        static it x=0;
        cout<<x<<end1;
        x++;
    }
    int main()
    {
        Demo(); 	// calling
        Demo();
        Demo();
        Demo();
    }
    


    /*
    ### Output ###
    0
    1
    2
    3
    */
```

    Here the Demo function is called four times and each time value is incremented by one.


### Register:storage class
1. registr variables is stored in one of the register of system, instead of memory
2. Value stored in register can be accessed faster than one that is stored in memory

![](resource:assets/images/C++/img8.png)

### Example

```
    #include<iostream>
    using namespace std;
    int main()
    {
        register int x,y=20,z=30;
        x=y+z;
        cout<<"Add="<<x
    }
    


    /*
    ### Output ###
    Add=50
    */
```

    

### external:storage class
1. Variable that can be used any where in the program is called external variable
2. External storage class does not create a variable, but its inform the compiler of its existence
3. `extern` keyword is used to declare external variable 

![](resource:assets/images/C++/img9.png)

### Example

```
    #include<iostream>
    using namespace std;
    int x=10; 	// extarnal variable
    int main()
    {
        extern int x=5;
        cout<<x;
    }
    


    /*
    ### Output ###
    5
    */
```
