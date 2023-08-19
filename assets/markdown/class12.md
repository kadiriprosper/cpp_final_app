<details><summary><b>Functions in C++</b></summary>

  - <details><summary><b>Function </b></summary>

    - **Definition**
  
	   1. It is a collection of statement that performs a specific task
	   2. It execute when it is called by its name
	   3. A large program is devided into a number of small building block for simplicity and this building block is called function
	   4. We can call a function again and again
	   5. The most important features of function is code reusability
	   6. The C library provides many pre-defined functions 
		<br>

    - **Syntax**

		<br>
	    <div align="center">
        <img src="../imgs/C++/img36.jpg" height="60%" width="60%">
	    </div>
	    <br>


    - **Key point about the function**
  
		- **Function Declaration:** At this stage the function is declared. 
  
		 For example: `void add()`

			
		- **Function Definition:** This is the place where actual code is written to perform the task.

		 For example


		```

			void add()
			{
				int x,y=20,z=30;
				x=y+z;
				cout<<"Add="<<x;
			};

		```

		

		- **Function Calling:** At this stage the function is called.

			For example: `add();`
			


    - **Complete Example**


		```

			#include <iostream>
			using namespace std;
			void add(); 	// function declarartion
			void add() 	// function definition
			{
				int x,y=20,z=30;
				x=y+z;
				cout<<"Add="<<x;
			}
			int main()
			{
				add(); 	// function calling
			}
		
	
		```

	- **Types of Function**

		There are two types of function
  
    	- **Predefined Function**
  
		The function which is predefined in the library is called predefined function. 
		Example:- `printf(), scanf(), clrscr(), getch()` etc


        - **Userdefined Function**
  
		The function is made by the user is called userdefined function.
		Example:- `add(), sub(), multi(). div()` [**Note:**  These are userdefined name, it may different]


	- **Category of Userdefined Function**
  
		There are four category of userdefined function:

  		- Function with no return type and no parameter
        - Function with no return type and with parameter
        - Function with return type and no parameter
        - Function with return type and parameter
  


	- **Function with no return type and no parameter**

		The function in which there is no value returning by that function is called **Function with no return type and no parameter**

		```

		#include<iostream>
		using namespace std;
		void add() 	// function definition
		{
			int x,y=20, z=30;
			x=y+z;
			cout<<"Add="<<x;
		}
		int main()
		{
			add(); 	// function calling
		}


		/*
		### Output ###
		Add=50
		*/

		```

		In the above example there is no parameter and no return type


	- **Function with no return type and with parameter**

		The function in which there is some parameter and there is no value returning by that function is called **Function with no return type and with parameter**


		```

		#include<iostream>
		using namespace std;
		void add(int y,int z) 	// function definition
		{
			int x;
			x=y+z;
			cout<<"Add="<<x;
		}
		int main()
		{
			add(10,20); 	// function calling
		}


		/*
		### Output ###
		Add=30
		*/

		```


		In the above example, there are two parameter of "integer" type namely 'y' and 'z' .

		There at the time of calling two integer value will be passed in which first will assign to y and second will assign to z.


	- **Function with return type and with no parameter**


		The function in which there is no parameter and there is some value returning by that function is called **Function with return type and with no parameter**


		```

		#include<iostream>
		using namespace std;
		void add() 	// function definition
		{
			int x,y=20,z=30;
			x=y+z;
			return x;
		}
		int main()
		{
			int rs=add(); 	// function calling
			cout<<"Add="<<rs; 
		}


		/*
		### Output ###
		Add=50
		*/

		```


		In the above example, there is no parameter but the function will return integer value because there is **int** keyword in the place of return type and return value will assign to variable **rs**.



	- **Function with return type and with parameter**	

		The function in which there is some parameter and there is some value returning by that function is called **Function with return type and with parameter**


		```

		#include<iostream>
		using namespace std;
		void add(int y,int z) 	// function definition
		{
			int x;
			x=y+z;
			return x;
		}
		int main()
		{
			int rs=add(50,30) 	// function calling
			cout<<"Add="<<rs;
		}


		/*
		### Output ###
		Add=80
		*/

		```


		In the above example, there is no parameter but the function will return integer value because there is **int** keyword in the place of return type and returned value will assign to variables **rs**



	- **Calling of Function**

		There are two ways of calling function:

		- Call By Value
		- Call By Reference


	- **Call By Value**

		In this type of calling a function direct value is passed at the time of calling.


		```

		#include<iostream>
		using namespace std;
		void add(int y,int z) 	// function definition
		{
			int x;
			x=y+z;
			cout<<"Add="<<x;
		}
		int main()
		{
			add(10,20); 	// function calling
		}


		/*
		### Output ###
		Add=30
		*/

		```

		In the above example we can see that direct value is passed at the time of calling.


	- **Call By Reference**


		1. In ths type of calling a function, the reference of the value is passed at the time of calling
		2. Reference is also called address
		3. When the address of data is passed at the time of calling so it is neccessary to use **pointer** in the place of parameter.
		4. For better understanding, see the example below:-


	 
	
		```

		#include<iostream>
		using namespace std;
		void sum(int *p,int *q) 	// function definition
		{
			int result=*p + *q;
			cout<<"Sum="<<result;
		}
		int main()
		{
			int x=10, y=20;
			// reference of variable is get using ampersand(&) operator
			sum(&x,&y); 	// function calling with refrence/address
		}


		/*
		### Output ###
		Add=30
		*/

		```


		In the above example, we can see that **x** and **y** are normal variable and reference of that variables are passed at the time of calling.


	- **Function with default value**

		- In this type of function, the functions contains a number of parameter with some initial value 
			**[for example: `void sum(int x=10,int y=20)`]**
		- At the etime of calling if there is no value is passed
			**[for example: `sum();`]** 
			then the default value will be x=10 and y=20, but if value passed 
			**[for example: `sum(5,6);`]** 
			then the value will be x=5 and y=6

		- For better understanding see the example below:


		```

		#include<iostream>
		using namespace std;
		void sum(int x=10,int y=20) 	// function definition
		{
			int result=x + y;
			cout<<"Add="<<result<<"\n";
		}
		int main()
		{
			int x=10, y=20;
			cout<<"Without value\n";
			sum(); 	// function calling without value
			cout<<"With value\n";
			sum(5,6); 	// function calling with value
			
		}


		/*
		### Output ###
		Without value
		Add=30
		With value
		Add=11
		*/

		```



	- **Passing Array to Function**

		In this type of function, there is an array in the place of parameter
		**[for example: `void sum(int ar[5])`]** and its value is passed at the time of calling.


		```

		#include<iostream>
		using namespace std;
		void sum(int ar[5]) 	// function definition
		{
			int s=0;
			for(int i=0;i<5;i++)
			s=s+ar[i];
			cout<<"Total suum of element="<<s;
		}
		int main()
		{
			int x[5]={10,20,50,40,60};
			sum(x); 	// function calling with array
			
		}


		/*
		### Output ###
		Total sum of element=180
		*/

		```

		In the above example, we can see that there is an array **ar[5]** in place of parameter and there as another array **x[5]={10,20,50,40,60}** and it is passed at the etime of calling therefore the value of array x will be copied into array ar.


	- **Recursion**


		The process of calling a function by itself is called **Recursion** and the function that calls itself is called **Recursive Function**.


		*Factorial of any Number using recursion <br> Factorial of 5=5*4*3*2*1*


		```

		#include<iostream>
		using namespace std;
		void factorial(int no,int f) 	// function definition
		{
			if(no>=1)
			{
				f=f*no;
				no--;
				factorial(no,f);
			}
			else
			cout<<"Factorial ="<<f;
		}
		int main()
		{
			int n;
			cout<<"Enter any number to find factorial\n";
			cin>>n;
			factorial(n,1); 	// function calling with array
			
		}


		/*
		### Output ###
		Enter any number to find factorial
		6
		Factorial =720
		*/

		```

	
		<a href="/Simple%20Programs/FUNCTION/Function%20Program%20List.md">Click for Practical Program</a>

  	</details>


  - <details><summary><b>String Function</b></summary>

	- **Definition**
  
	   1. Sring is a collection of character
	   2. C does not support string data type. Therefore char data type is used to make string
	   3. String in C is stored in single dimension character array
	   4. There are many predefined string function in C library
	   5. All the string functions are predefined in `string.h` header file


		<br>
	    <div align="center">
        <img src="../imgs/C%2B%2B/img37.jpg" height="60%" width="60%">
	    </div>
	    <br>


    - **strlen(s)**

		```

		#include<iostream.h>
		#include<conio.h>
		#include<string.h>
		int main()
		{
			char name[200]="Easy";
			cout<<strlen(name);
			return 0;
		}


		/*
		### Output ###
		4 	// because there is 4 character in Easy
		*/

		```


		<br><br>

    - **strcpy(s1,s2)**

		```

		#include<iostream.h>
		#include<conio.h>
		#include<string.h>
		int main()
		{
			char name1[200]="Prosper";
			char name2[200]="Nemo";
			strcpy(name1,name2);
			cout<<name1;
			return 0;
		}


		/*
		### Output ###
		Nemo
		*/

		```

		<br><br>

    - **strcmp(s1,s2)**


		```

		#include<iostream.h>
		#include<conio.h>
		#include<string.h>
		int main()
		{
			char s1[200]="Easy";
			char s2[200]="Easy";
			if(strcmp(s1,s2)==0);
			{
				cout<<"string s1 and string s2 are same.";
			}
			else
			{
				cout<<"string s1 and string s2 are not same.";
			}
			return 0;
		}


		/*
		### Output ###
		string s1 and string s2 are same.
		*/

		```

		<br><br>



	- **strcat(s1,s2)**


		```

		#include<iostream.h>
		#include<conio.h>
		#include<string.h>
		int main()
		{
			char s1[200]="Easy";
			char s2[200]="Programming";
			cout<<,strcat(s1,s2);
			return 0;
			
		}


		/*
		### Output ###
		Easy Programming
		*/

		```

		<br><br>


	- **strrev(s)**


		```

		#include<iostream.h>
		#include<conio.h>
		#include<string.h>
		int main()
		{
			char s1[200]="ABCD";
			cout<<,strrev(s);
			return 0;
			
		}


		/*
		### Output ###
		DCBA
		*/

		```

		<br><br>



	- **strupr(s)**


		```

		#include<iostream.h>
		#include<conio.h>
		#include<string.h>
		int main()
		{
			char s[200]="Easy";
			cout<<,strupr(s);
			return 0;
			
		}


		/*
		### Output ###
		EASY
		*/

		```

		<br><br>


	- **strlwr(s)**


		```

		#include<iostream.h>
		#include<conio.h>
		#include<string.h>
		int main()
		{
			char s[200]="Easy";
			cout<<,strlwr(s);
			return 0;
			
		}


		/*
		### Output ###
		easy
		*/

		```

		<br><br>


	


		<a href="##">Click for Practical Program</a>
	
  

    </details>

  - <details><summary><b>Math Function</b></summary>
  
    - **Definition**
  
	   1. It is used to perform the mathematical related operation
	   2. There are many predefined math function in C libray
	   3. All the math function are predefined in `math.h` header file


		<br>
	    <div align="center">
        <img src="../imgs/C%2B%2B/../C++/img38.jpg" height="60%" width="60%">
		<br>
		<img src="../imgs/C%2B%2B/../C++/img38b.jpg" height="60%" width="60%">
	    </div>
	    <br>



    - **Example:**

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

		
    - **floor() function:- It always return minimum round off value**

		

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



	- **ceil() function:- It always return maximum round of value**

		

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



	- **round() function**

		

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

   
   
   </details>


</details>
