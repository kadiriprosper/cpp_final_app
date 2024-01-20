## Definition

1. It is used to perform the mathematical related operation
2. There are many predefined math function in C libray
3. All the math function are predefined in `math.h` header file



![](resource:assets/images/C++/img37.png)

![](resource:assets/images/C++/img38.png)


### Example:

```

    #include<iostream.h>
    #include<conio.h>
    #include<math.h>
    int main()
    {
        float a=2;
        cout<<"sin(2)="<<sin(a)<<"\n";
        cout<<"sin(2)="<<cos(a)<<"\n";
        cout<<"sin(2)="<<tan(a)<<"\n";
        cout<<"sin(2)="<<exp(a)<<"\n"; 	// exponential
        cout<<"sin(2)="<<log(a)<<"\n";	 // natural log
        cout<<"sin(2)="<<log10(a)<<"\n"; 	// log10
        cout<<"sin(2)="<<sqrt(a)<<"\n"; 	// square root
        cout<<"sin(2)="<<cbrt(a)<<"\n"; 	// cube root
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


### floor() function:

- **It always return minimum round off value**



```

    #include<iostream.h>
    #include<conio.h>
    #include<math.h>
    int main()
    {
        cout<<"sin(2)="<<floor(2.3)<<"\n";
        cout<<"sin(2)="<<floor(2.5)<<"\n";
        cout<<"sin(2)="<<floor(2.8)<<"\n";
        return 0;
    }


    /*
    ### Output ###
    2.0
    2.0
    2.0
    */

```



### ceil() function: 

**It always return maximum round of value**



```

    #include<iostream.h>
    #include<conio.h>
    #include<math.h>
    int main()
    {
        cout<<"sin(2)="<<ceil(2.3)<<"\n";
        cout<<"sin(2)="<<ceil(2.5)<<"\n";
        cout<<"sin(2)="<<ceil(2.8)<<"\n";
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

    #include<iostream.h>
    #include<conio.h>
    #include<math.h>
    int main()
    {
        cout<<"sin(2)="<<round(2.3)<<"\n";
        cout<<"sin(2)="<<round(2.5)<<"\n";
        cout<<"sin(2)="<<round(2.8)<<"\n";
        return 0;
    }


    /*
    ### Output ###
    2.0
    3.0
    3.0
    */
        

```


