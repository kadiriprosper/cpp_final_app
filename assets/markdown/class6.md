<details><summary><b>Operator in C++</b></summary>

<br>
	<div align="center">
   	<img src="../imgs/C%2B%2B/img10.jpg" height="60%" width="60%">
	</div>
	<br>

- **Operator**
	It is a special symbol which is used to perform logical or mathematical operation on data or variable.

- **operand**
	It is a data or variable on which the operation is to be performed.

- **Types of Operator**
	- Arithmetic Operators
	- Relational Operators
	- Logical Operators
	- Assignment Operators
	- Bitwise Operators
	- Increment/Decrement Operators
	- Conditional Operators
	- Special Operators

<br>


- **Arithmetic Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img11.jpg" height="60%" width="60%">
	</div>
	<br>

	```
	#include<iostream>
	using namespace std;
	int main()
	{
		int a=5,b=3;
		cout<<(a+b)<<"\n";
		cout<<(a-b)<<"\n";
		cout<<(a*b)<<"\n";
		cout<<(a/b)<<"\n";
		cout<<(a%b)<<"\n"; 	// %(modulus) holds remainder
	}

	/*
	### Output ###
	8
	2
	15
	1
	2
	*/
	```


	<br>

- **Relational Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img12.jpg" height="60%" width="60%">
	</div>
	<br>


<br>


- **Logical Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img13.jpg" height="60%" width="60%">
	</div>
	<br>
	
	```
	#include<iostream>
	using namespace std;
	int main()
	{
		int a=10,b=50,c=30;
		if(a>b&&a>c)
		cout<<"a is greater";
		if(b>a&&b>c)
		cout<<"b is greater";
		if(c>a&&c>b)
		cout<<"c is greater";
	}

	/*
	### Output ###
	b is greater
	*/
	```

<br>


- **Assignment Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img14.jpg" height="60%" width="60%">
	</div>
	<br>


	```
	#include<iostream>
	using namespace std;
	int main()
	{
		int x1=5,y1=3;
		x1+=y1; 	// x1=x1+y1
		cout<<"x1="<<x1<<"\n";

		int x2=5,y2=3;
		x2-=y2; 	// x2=x2-y2
		cout<<"x2="<<x2<<"\n";

		int x3=5,y3=3;
		x3*=y3; 	// x3=x3*y3
		cout<<"x3="<<x3<<"\n";

		int x4=5,y4=3;
		x4/=y4; 	// x4=x4/y4
		cout<<"x4="<<x4<<"\n";

		int x5=5,y5=3;
		x5%=y5; 	// x5=x5%y5
		cout<<"x5="<<x5<<"\n";
	}

	/*
	### Output ###
	x1=8
	x2=2
	x3=15
	x4=1
	x5=2
	*/
	```

<br>


- **Bitwise Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img15.jpg" height="60%" width="60%">
	</div>
	<br>


	```
	#include<iostream>
	using namespace std;
	int main()
	{
		int a=5,b=3,c; 	// variable declaration
		c=a&b; 	 	// AND operation
		cout<<"a&b="<<c<<"\n";
		c=a|b; 	 	// OR operation
		cout<<"a|b="<<c<<"\n";
		c=a>>2; 	 	// shift right operation
		cout<<"a>>2="<<c<<"\n";
		c=a<<2; 	 	// shift center operation
		cout<<"a<<2="<<c<<"\n";
		
	}

	/*
	### Output ###
	a&b=1
	a|b=7
	a>>2=1
	a<<2=20
	*/
	```


<br>


- **Increment/Decrement Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img16.jpg" height="60%" width="60%">
	</div>
	<br>


	```
	#include<iostream>
	using namespace std;
	int main()
	{
		int a=5,b=10;
		cout<<++a<<end1;
		cout<<--b;
	}

	/*
	### Output ###
	6
	9
	*/
	```


<br>


- **Conditional Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img17.jpg" height="60%" width="60%">
	</div>
	<br>


	```
	#include<iostream>
	using namespace std;
	int main()
	{
		int a=10,b=20;
		a>b?
		cout<<"a is greater than b":cout<<"b is greater than a";
	}

	/*
	### Output ###
	b is greater than a
	*/
	```

<br>


- **Special Operators**

	<br>
	<div align="center">
    <img src="../imgs/C%2B%2B/img18.jpg" height="60%" width="60%">
	</div>
	<br>

</details>
