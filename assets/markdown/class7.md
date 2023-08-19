<details><summary><b>IF Statement in C++</b></summary>

  - <details><summary><b> IF Statement</b></summary>

	  - **Syntax**

		<br>
		<div align="center">
   		<img src="../imgs/C%2B%2B/img19.jpg" height="60%" width="60%">
		</div>
		<br>


		1. If the condition is true its body execute otherwise does not execute
		2. In the case of if in the place of condition always zero and non-zero value is checked. 
		3. In which zero means condition false and non-zero means condition true.


		- **Example**

			```
			#include<iostream>
			#include<conio.h>
			int main()
			{
				// Assign value to the variable 
				int x=50,y=20;
				// checking the condition
				if(x>y)
				{
					cout<<"x is greater than y";
				}
			}


			/*
			### Output ###
			x is greater than y
			*/
			```


		<br>

		<a href="##">Click for Practical Program</a>


    </details>

  - <details><summary><b>IF else statement </b></summary>


	   <br>
	   <div align="center">
       <img src="../imgs/C%2B%2B/img20.jpg" height="60%" width="60%">
	   </div>
	   <br>


	  - **Syntax**
		1. If the condition is true, 'if' part is executes and if the conditions is false, 'else' part is execute
		2. In the case of 'if' in the condition always zero and non-zero value is checked 
		3. In which zero means condition false and non-zero means condition true  


		<br>

	  - **Example**


		  ```
		    #include<iostream>
			int main()
			{
				// Assign value to the variable 
				int x=50,y=20;
				// checking the condition
				if(x==y)
				{
					cout<<"x is equal to y";
				}
				else
				{
					cout<<"x is not equal to y";
				}
			}


			/*
			### Output ###
			// In the above program condition is 'false' because te value of x=50 and y=20 and they are not equal, so 'else' part will execute

			x is not equal to y
			*/
		  ```


	<a href="##">Click for Practical Program</a>

	</details>

  - <details><summary><b>IF else ladder statement </b></summary>

	   <br>

	   <div align="center">
   	   <img src="../imgs/C%2B%2B/img21.jpg" height="60%" width="60%">
	   </div>
	   <br>

	  - **Syntax**
		1. It is a part of conditional statement that executes only one condition at a time
		2. If all condition are false then 'else' part executes
		3. It executes that condition that becomes first true from the top
		4. In the case of 'if' in the place of condition always zero and non-zero value is checked in which zero means condition 'false' and non-zero means conditon 'true'


		<br>

	  - **Example**


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


	<a href="##">Click for Practical Program</a>
	

	</details>

  - <details><summary><b>Nested IF</b></summary>

	   <br>
	   <div align="center">
       <img src="../imgs/C%2B%2B/img22.jpg" height="60%" width="60%">
	   </div>
	   <br>

	  - **Syntax**

		1. Nested means "one inside another", so one 'if' inside another 'if' is called 'nested if'
		2. In case of 'if' in the place of condition always zero and non-zero value is checked in which zero means condition 'false' and non-zero means condition 'true'
		  

	  - **Example**


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



		<a href="##">Click for Practical Program</a>
	</details>

	

</details>
