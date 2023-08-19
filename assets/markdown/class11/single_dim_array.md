- **Definition**

1. It is a collection of data of same data type
2. It is used to store group of data simultaneously
3. It can store data of the same data type (i.e an integer array can store only integer value, character array can store only character value and so on)
4. We can not fetch data from array directly , therefore, we use index point
5. The indexing of array alway start with '0'
6. Index value is always an integer number
7. Array may be of any data type like `int,char,float` etc

<br>

- **Syntax**

<br>
<div align="center">
<img src="../imgs/C++/img30.jpg" height="60%" width="60%">
</div>
<br>

1. Here 'a' is the name of array
2. 'int' is the data type of array
3. Size of array is 5 means, we can store maximum of 5 values in this array


- **Initialization of array (method 1)**

<br>
<div align="center">
<img src="../imgs/C++/img31.jpg" height="60%" width="60%">
</div>
<br>


- **Initialization of array (method 2)**

<br>
<div align="center">
<img src="../imgs/C++/img32.jpg" height="60%" width="60%">
</div>
<br>

- **Printing of array element (method 1)**

```

#include<iostream>
using namespace std;
int main()
{
    int a[5]={20,10,80,70,60};
    cout<<"value at a[0]="<<a[0]<<"\n";
    cout<<"value at a[1]="<<a[1]<<"\n";
    cout<<"value at a[2]="<<a[2]<<"\n";
    cout<<"value at a[3]="<<a[3]<<"\n";
    cout<<"value at a[4]="<<a[4]<<"\n";
}


/*
### Output ###
value at a[0]=20
value at a[1]=10
value at a[2]=80
value at a[3]=70
value at a[4]=60

*/

```


- **Printing of array element using loop (method 2)**

```

#include<iostream>
using namespace std;
int main()
{
    int a[5]={20,10,80,70,60};
    for(int i=0;i<=4;i++)
    cout<<"value at a["<<i<<"]="<<a[i]<<"\n";
}


/*
### Output ###
value at a[0]=20
value at a[1]=10
value at a[2]=80
value at a[3]=70
value at a[4]=60

*/

```


- **User input in array**

```

#include<iostream>
using namespace std;
int main()
{
    int a[5];
    cout<<"Enter element 1=";
    cin>>a[0];
    cout<<"Enter element 2=";
    cin>>a[1];
    cout<<"Enter element 3=";
    cin>>a[2];
    for(int i=0;i<=2;i++)
    cout<<"Value at a["<<i<<"]="<<a[i]<<"\n";
    
}


/*
### Output ###
Enter element 1=45
Enter element 2=20
Enter element 3=60
value at a[0]=45
value at a[1]=20
value at a[2]=60

*/

```


- **User input in array using loop**

```

#include<iostream>
using namespace std;
int main()
{
    int a[5],i;
    for(int i=0;i<=2;i++)
    {
        cout<<"Enter element "<<i+1<<"=";
        cin>>a[i];
    }
    for(int i=0;i<=2;i++)
    cout<<"Value at a["<<i<<"]="<<a[i]<<"\n";
    
}


/*
### Output ###
Enter element 1=45
Enter element 2=20
Enter element 3=60
value at a[0]=45
value at a[1]=20
value at a[2]=60

*/

```




<br>


<a href="##">Click for Practical Program</a>
