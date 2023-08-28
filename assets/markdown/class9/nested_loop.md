## Definition:
A loop inside another loop is called "nested loop", so one 'for loop' inside another 'for loop' is called "nested loop"

<!-- - **Syntax**

<br>
<div align="center">
<img src="../imgs/C++/img27.jpg" height="60%" width="60%">
</div>
<br> -->
    
### Example


```
    #include<iostream.h>
    int main()
    {
        int n;
        cout<<"Enter number upto you want to print prime number\n";
        cin>>n;
        for(int i=2;i<=n;i++)
        {
            int no=i,m=0;
            for(int j=2;j<=no-1;j++)
            {
                if(no%j==0)
                m=1;
            }
            if(m==0)
            cout<<no<<" ";
        }
        
    }


    /*
    ### Output ###
    Enter number upto you want to print prime number
    20
    2 3 5 7 11 13 17 19 
    */
```


<!-- <a href="##">Click for Practical Program</a> -->
