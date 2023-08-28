## Definition
- To run the body countinously untill a required condition is fullfill is called "looping".
- It is used to perform looping operation, when the condition will become false the execution of loop will be stopped 

<br>

<div align="center">
<img src="../imgs/C++/img26.jpg" height="60%" width="60%">
</div>
<br>

### Syntax
1. Its body will execute until the given condition is true.


<br>

### Example


```
    #include<iostream.h>
    int main()
    {
        int i=1;
        do
        {
            cout<<i<<"\n";
            i++;
        }
        while(i<=10);
    }


    /*
    ### Output ###
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

    */
```

**Note:** In the above program, 'i' is a variable which is initialixed with '1', conditin goes to 10 and it is incremented by 1 so the output will be 1 to 10.


<!-- <a href="##">Click for Practical Program</a> -->
