## Arrays in C

## Single Dimension Array

### Definition

1. It is a collection of data of same data type
2. It is used to store group of data simultaneously
3. It can store data of the same data type (i.e an integer array can store only integer value, character array can store only character value and so on)
4. We can not fetch data from array directly , therefore, we use index point
5. The indexing of array alway start with '0'
6. Index value is always an integer number
7. Array may be of any data type like `int,char,float` etc

<br>

### Syntax

![](resource:assets/images/C/img-b26.png)

1. Here 'a' is the name of array
2. 'int' is the data type of array
3. Size of array is 5 means, we can store maximum of 5 values in this array


### Initialization of array (method 1)

<br>
```
int a[5]={45,23,89,12,78};
```
<br>

![](resource:assets/images/C/img-b27.png)

### Initialization of array (method 2)

<br>
```
int a[5];
a[0]=45;
a[1]=23;
a[2]=89;
a[3]=12;
a[4]=78;
```

### Printing of array element (method 1)

```
#include<stdio.h>
int main()
{
	int a[5]={20,10,80,70,60};
	printf("value at a[0]=%d\n",a[0]);
	printf("value at a[1]=%d\n",a[1]);
	printf("value at a[2]=%d\n",a[2]);
	printf("value at a[3]=%d\n",a[3]);
	printf("value at a[4]=%d\n",a[4]);
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


### Printing of array element using loop (method 2)

```
#include<stdio.h>
int main()
{
	int a[5]={20,10,80,70,60};
	for(int i=0;i<=4;i++)
	printf("value at a[%d]=%d\n",i,a[i]);
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
### User input in array

```
#include<stdio.h>
int main()
{
	int a[5]; 	// declaring array
	printf("Enter element 1=");
	scanf("%d",&a[0]); 		// taking input as index 0
	printf("Enter element 2=");
	scanf("%d",&a[1]); 		// taking input as index 1
	printf("Enter element 3=");
	scanf("%d",&a[2]); 		// taking input as index 2
	for(int i=0;i<=2;i++)
	{
	printf("Value at a["%d"]=%d\n",i,a[i]);
	}
	
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


### User input in array using loop

```
#include<stdio.h>
int main()
{
	int a[5],i;
	for(int i=0;i<=2;i++)
	{
		printf("Enter element %d=",(i+1));
		scanf("%d",&a[i]);
	}
	for(int i=0;i<=2;i++)
	printf("Value at a[%d]=%d\n",i,a[i]);
	
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

<a href="##">Click for Practical Program</a>


## Double Dimension Array in C

### Definition

1. It is a collection of data of same data type
2. It is used to store group of data simultaneously
3. It can store data of the same data type (i.e an integer array can store only integer value, character array can store only character value and so on)
4. We can not fetch data from array directly , therefore, we use index point
5. The indexing of array alway start with '0'
6. Index value is always an integer number
7. Array may be of any data type like `int,char,float` etc

### Syntax

![](resource:assets/images/C/img-b28.png)

1. Here 'a' is the name of array
2. 'int' is the data type of array
3. Size of array is 3x3 means, we can store maximum of 9 values in this array


### Initialization of array (method 1)

<br>
```
int a[3][3]={{40,50,60}, {10,20,30}, {70,80,90}};
```

![](resource:assets/images/C/img-b29.png)


### Initialization of array (method 2)

```
int a[5];
a[0][0]=40;
a[0][1]=50;
a[0][2]=60;
a[1][0]=10;
a[1][1]=20;
a[1][2]=30;
a[2][0]=70;
a[2][1]=80;
a[2][2]=90;
```

![](resource:assets/images/C/img-b29.png)


### Printing of array element (method 1)
```
#include<stdio.h>
int main()
{
	int a[3][3]={{10,20,30},{70,80,90},{40,50,60}};
	printf("value at a[0][0]=%d\n",a[0][0]);
	printf("value at a[0][1]=%d\n",a[0][1]);
	printf("value at a[0][2]=%d\n",a[0][2]);
	printf("value at a[1][0]=%d\n",a[1][0]);
	printf("value at a[1][1]=%d\n",a[1][1]);
	printf("value at a[1][2]=%d\n",a[1][2]);
	printf("value at a[2][0]=%d\n",a[2][0]);
	printf("value at a[2][1]=%d\n",a[2][1]);
	printf("value at a[2][2]=%d\n",a[2][2]);
	
}


/*
### Output ###
value at a[0][0]=10
value at a[0][1]=20
value at a[0][2]=30
value at a[1][0]=70
value at a[1][1]=80
value at a[1][2]=90
value at a[2][0]=40
value at a[2][1]=50
value at a[2][2]=60

*/
```


### Printing of array element using loop (method 2)

```
#include<stdio.h>
int main()
{
	int a[3][3]={{10,20,30},{70,80,90},{40,50,60}};
	for(int i=0;i<=2;i++)
	{
		for(int j=0;j<=2;j++)
		{
			printf("%d",a[i][j]);
		}
		printf("\n");
	}
}


/*
### Output ###
10 20 30
70 80 90
40 50 60

*/
```


### User input in array using loop

```
#include<stdio.h>
int main()
{
	int a[3][3]; 		//declaring array
	int i,j;
	for(i=0;i<=2;i++)
	{
		for(j=0;j<=2;j++)
		{
		printf("Enter element at a[%d][%d]=",i,j);
		scanf("%d",&a[i])[j];
		}
	}
	for(i=0;i<=2;i++)
	{
		for(j=0;j<=2;j++)
		{
			printf("%d",a[i][j]);
		}
		printf("\n");
	}
}


/*
### Output ###
Enter element at a[0][0]=5
Enter element at a[0][1]=6
Enter element at a[0][2]=5
Enter element at a[1][0]=8
Enter element at a[1][1]=7
Enter element at a[1][2]=9
Enter element at a[2][0]=3
Enter element at a[2][1]=1
Enter element at a[2][2]=5

5 6 5
8 7 9
3 1 5

*/
```

<a href="##">Click for Practical Program</a>