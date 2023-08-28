## Definition
- To run the body countinously untill a required condition is fullfill is called "looping".
- It is used to perform looping operation, when the condition will become false the execution of loop will be stopped 


<br>
<div align="center">
<img src="../imgs/C++/img25.jpg" height="60%" width="60%">
</div>
<br>

### Syntax
1. Its body will execute until the given condition is true


<br>

### Example


```
    #include<iostream>
    int main()
    {
        
        int i=1;
        while(i<=10)
        {
            cout<<i<<"\n";
            i++;
        }
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

In the above program, 'i' is a variable which is initialized with '1', condition goes to 10 and it is incremented by 1 so the output will be 1 to 10. 


<!-- <a href="##">Click for Practical Program</a> -->
