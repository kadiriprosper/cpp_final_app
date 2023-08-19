<details><summary><b>Variables in C++</b></summary>

  - <details><summary><b>Variables</b></summary>

      - **Definition**
     	1. It is a name of storage space which is used to store data
     	2. It's value is changable
     	3. It always contains last value stored to it
     	4. It's always declare with data type

	  - In C++, there are different types of variables (defined with different keywords), for example:

        * `int` - stores integers (whole numbers), without decimals, such as 123 or -123
        * `double` - stores floating point numbers, with decimals, such as 19.99 or -19.99
        * `char` - stores single characters, such as 'a' or 'B'. Char values are surrounded by single quotes
        * `string` - stores text, such as "Hello World". String values are surrounded by double quotes
        * `bool` - stores values with two states: true or false

      - **Varable Declaration**

		```
			int rollno;
			float marks;
			char grade;
	
		```

		Here:
        - rollno is a variable of type int
        - marks is a variable of type float
        - grade is a variable of type char

      - **Variable Initialization**

		```
			int rollno=201
			float marks=85.6
			char grade='A'

		```

		Here:
        - 201 is the value of rollno
        - 85.6 is the value of marks
        - A is the value of grade (Character value is always written in single quotes)

      - **Rules to declare a variable**
     	1. The first letter of a variable should be alphabet or underscore(_)
     	2. The first letter of a variable should not be digit
     	3. After first character it may be combination of alphabets and digits
     	4. Blank space are not allowed in variable name 
     	5. Variable name should not be a keyword 


	 - **To create a variable, specify the type and assign it a value:**

 		`type variableName = value;`
 
 		**Note:** Where `type` is one of C++ types (such as `int`), and `variableName` is the name of the variable (such as x or myName). The equal sign is used to assign values to the variable.
 
 			**Example 1**

			Create a variable called x of type int and assign it the value 15:
			```
			#include <iostream>
			using namespace std;

			int main() {
  				int myNum = 15;
  				cout << myNum;
  				return 0;
			}

			```

	</details>

  - <details><summary><b>Constant in C++</b></summary>

      - **Definition**
        1. An elemnt of program whose value can not be changed at the time of execution of program is called constant
        2. It is also called 'literals'
        3. It may be int, float and char data type

      - **Rules for constructing integer constant**
        1. It must have atleast one digit
        2. It must not have a decimal point
        3. It may be positive (+ve) or negative (-ve)
        4. The range of integer constant is between -32768 to +32767
        5. No comma or blank sppace are allowed in integer constant

      - **Rules for constructing floating constant**
        1. It must have atleast one digit
        2. It must not have a decimal point
        3. It may be positive or negative
        4. No comma or blank sppace are allowed in floating constant


      - **Rules for constructing character constant**
        1. It is a single alphabet, digit, or special symbol
        2. The length of character constant is 1 character
        3. Charcter constant is enclosed within single quotes (Example: char c='A';)


      - **Use of constant in program**
		There are two way of using constants in the C/C++ program 

        - Using const
        - Using #define


    </details>


  - <details><summary><b>Storage Classes in C++</b></summary>

      - **Definition**
		A storage classes in C++ defines the **scope, lifetime, default initial value** and **storage space** of a variable.

		There are four storage classes in C++:
        1. automatic
        2. static
        3. register
        4. external

        - **automatic:storage class**
          1. Automatic variables are declared inside a function in which they havae to used
          2. When the function is called automatic variables are created and destroy when function is exited
          3. Automatic variables can nt be used outside that function in which its declared. It means w can say that it is private member
          4. Automatic variables are also known as local variable
          5. `auto` keyword is usd to declare automatic ttype variable
   
			<br>
       		<div align="center">
   			<img src="../imgs/C%2B%2B/img6.jpg" height="60%" width="60%">
			</div>
			<br>


        - **Example**
        
			```
			#include<iostream>
			using namespace std;
			int main()
			{
				auto int x=5;
				{
					auto int x=3;
					{
						auto x=1;
						cout<<x<<end1;
					}
					cout<<x<<end1;
				}
				cout<<x<<end1;
			}


			/*
			### Output ###
			1
			3
			5
			*/
			```

			Here the value of innermost x is 1, out of this block value is 3 and out of this block is 5.


		- **static:storage class**
          1. Static variables can be used anywhere in the program inside or outside of a function or block
          2. The value of a static variable exits untill the end of program
          3. The satic variable which is declared inside a function is called "internal static variable" and it can not be used outside that function
          4. The static variable which is declared outside a function is called external variable" and it can be used in all the function of that program
   
			<br>
       		<div align="center">
   			<img src="../imgs/C%2B%2B/img7.jpg" height="60%" width="60%">
			</div>
			<br>


        - **Example**
        
			```
			#include<iostream>
			using namespace std;
			void demo()
			{
				static it x=0;
				cout<<x<<end1;
				x++;
			}
			int main()
			{
				Demo(); 	// calling
				Demo();
				Demo();
				Demo();
			}
			


			/*
			### Output ###
			0
			1
			2
			3
			*/
			```

			Here the Demo function is called four times and each time value is incremented by one.


		- **Register:storage class**
          1. registr variables is stored in one of the register of system, instead of memory
          2. Value stored in register can be accessed faster than one that is stored in memory
   
			<br>
       		<div align="center">
   			<img src="../imgs/C%2B%2B/img8.jpg" height="60%" width="60%">
			</div>
			<br>


        - **Example**
        
			```
			#include<iostream>
			using namespace std;
			int main()
			{
				register int x,y=20,z=30;
				x=y+z;
				cout<<"Add="<<x
			}
			


			/*
			### Output ###
			Add=50
			*/
			```

			

		- **external:storage class**
          1. Variable that can be used any where in the program is called external variable
          2. External storage class does not create a variable, but its inform the compiler of its existence
          3. `extern` keyword is used to declare external variable 


			<br>
       		<div align="center">
   			<img src="../imgs/C%2B%2B/img9.jpg" height="60%" width="60%">
			</div>
			<br>


        - **Example**
        
			```
			#include<iostream>
			using namespace std;
			int x=10; 	// extarnal variable
			int main()
			{
				extern int x=5;
				cout<<x;
			}
			


			/*
			### Output ###
			5
			*/
			```


    </details>

</details>
