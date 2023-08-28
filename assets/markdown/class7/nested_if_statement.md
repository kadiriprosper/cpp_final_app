<div align="center">
<img src="../imgs/C%2B%2B/img22.jpg" height="60%" width="60%">
</div>
<br>

## Nested If Statement

1. Nested means "one inside another", so one 'if' inside another 'if' is called 'nested if'
2. In case of 'if' in the place of condition always zero and non-zero value is checked in which zero means condition 'false' and non-zero means condition 'true'
    

### Example


```
    #include<iostream>
    int main()
    {
        // Assign value to the variable 
        int x=10;
        if(x>5) 	// checking the condition
        {
            if(x<15) 	// checking the condition
            {
                cout<<"x is greater than 5 and less than 15";
            }
        }
        
    }


    /*
    ### Output ###
    x is greater than 5 and less than 15
    */
```

**Note:** In the above program the outer 'if' condition is 'true', so it's body will execute and the condition of inner 'if' is also 'true', so the output is "x is greater than 5 and less than 15"



<!-- <a href="##">Click for Practical Program</a> -->
