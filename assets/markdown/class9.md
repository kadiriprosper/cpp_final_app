<details><summary><b>Loop-Type in C++</b></summary>


  - <details><summary><b> For Loop</b></summary>

	  - **Definition**

		To run the body countinously untill a required condition is fullfill is called looping.

		When the condition will become 'false' the execution of loop will be stopped.

	  - **Syntax**

		<br>
		<div align="center">
   		<img src="../imgs/C%2B%2B/img24.jpg" height="60%" width="60%">
		</div>
		<br>


		1. In 'for loop' there are three part: initialization, condition and increment/decrement
		2. Initialization part executes only once
		3. All the three part of 'for loop' are optional 


		- **Example**

			```
			#include<iostream>
			int main()
			{
				for(int i=1;i<=10;i++)
				{
					cout<<i<<"\n";
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

			In the above program, 'i' is a variable which is initialized with 1, condition goes to 10 and it is incremented by 1.

			So the output will be 1 to 10.


		<br>

		<a href="##">Click for Practical Program</a>


    </details>

  - <details><summary><b>While Loop </b></summary>

	  - **Definition**
		- To run the body countinously untill a required condition is fullfill is called "looping".
		- It is used to perform looping operation, when the condition will become false the execution of loop will be stopped 


	   <br>
	   <div align="center">
       <img src="../imgs/C++/img25.jpg" height="60%" width="60%">
	   </div>
	   <br>


	  - **Syntax**
		1. Its body will execute until the given condition is true


		<br>

	  - **Example**


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


	<a href="##">Click for Practical Program</a>

	</details>

  - <details><summary><b>Do While Loop </b></summary>
	  - **Definition**
		- To run the body countinously untill a required condition is fullfill is called "looping".
		- It is used to perform looping operation, when the condition will become false the execution of loop will be stopped 

	   <br>

	   <div align="center">
   	   <img src="../imgs/C++/img26.jpg" height="60%" width="60%">
	   </div>
	   <br>

	  - **Syntax**
		1. Its body will execute until the given condition is true.


		<br>

	  - **Example**


		  ```
		    #include<iostream.h>
			int main()
			{
				int i=1;
				do
				{
					cout<<i<<"\n";
					i++;
				}
				while(i<=10);
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

		  **Note:** In the above program, 'i' is a variable which is initialixed with '1', conditin goes to 10 and it is incremented by 1 so the output will be 1 to 10.


	<a href="##">Click for Practical Program</a>
	

	</details>

  - <details><summary><b>Nested Loop</b></summary>

	  - **Definition**
	  	A loop inside another loop is called "nested loop", so one 'for loop' inside another 'for loop' is called "nested loop"

	  - **Syntax**

	   <br>
	   <div align="center">
       <img src="../imgs/C++/img27.jpg" height="60%" width="60%">
	   </div>
	   <br>
		  

	  - **Example**


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


		<a href="##">Click for Practical Program</a>
	</details>



</details>
