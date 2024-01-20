## Definition

1. It is a collection of named integer constant
2. It is a user define data type
3. `enum` keyword is used to create a enumeration
4. **Note:** Union does not support multiple value simultaneously. <br> It can only store one value at a time.


### Syntax

![](resource:assets/images/C++/img41.png)

### Example:

```
    enum week {sunday,monday,tuesday,wednesday,thursday,friday,saturday};
```

**Here:**
1. enum is a keyword
2. week is the name of union and its a user defined data type
3. sunday,monday,tuesday,wednesday,thursday,friday,saturday are the values of enum

<br>

**Default numerical value of the member of enum is given below:**

- Default value of sunday is 0
- Default value of monday is 1
- Default value of tuesday is 2
- Default value of wednesday is 3
- Default value of thursday is 4
- Default value of friday is 5
- Default value of saturday is 6


**for better understanding, see the below example:**

### **Example 1:**



```

    #include <iostream.h>
    using namespace std;
    enum week {sunday,monday,tuesday,wednesday,thursday,friday,saturday};
    int main()
    {
        enum week obj;
        obj=wednesday;
        cout<<"Value of wenesday"<<obj;
    }
    

    ### output ###
    Value of wenesday=3
    

```



### Example2:

**We can aslo change the default value of member of enum**



```

    #include <iostream.h>
    using namespace std;
    enum week {sunday=20,monday=50,tuesday=18,wednesday=95,thursday=84,friday=60,saturday=55};
    int main()
    {
        enum week obj;
        obj=wednesday;
        cout<<"Value of wenesday"<<obj;
    }
    

    ### output ###
    Value of wenesday=95
    

```
<!-- <a href="##">Click for Practical Program</a> -->