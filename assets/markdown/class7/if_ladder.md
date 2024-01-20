![](resource:assets/images/C++/img21.png)

## If-else ladder statement
1. It is a part of conditional statement that executes only one condition at a time
2. If all condition are false then 'else' part executes
3. It executes that condition that becomes first true from the top
4. In the case of 'if' in the place of condition always zero and non-zero value is checked in which zero means condition 'false' and non-zero means conditon 'true'


<br>

### Example

```
    #include<iostream>
    int main()
    {
        // Assign value to the variable 
        int x=10;
        if(x>5) 	// checking the condition
        {
            cout<<"x is greater than 5";
        }
        else if(x<8) 	// checking the condition
        {
            cout<<"x is less than 8";
        }
        else if(x==10) 	// checking the condition
        {
            cout<<"x is equal to 10";
        }
        else
        {
            cout<<"No one condition is true";
        }
    }


    /*
    ### Output ###
    x is greater than 5
    */
```

**Note:** As we can see from the above program, there are three conditions in which first and third condition are true but the it executes only one condition that becomes first true from the above so the output is "x is greater than 5" 


<!-- <a href="##">Click for Practical Program</a> -->
