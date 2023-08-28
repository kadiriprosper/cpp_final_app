## Definition

Switch statement allows us to execute one statement from many statement and those statements are called **case**.

Actually in switch statement, inside the body of switch a number of cases are used and a parameter are passed and from which cas this parameter is matched, executed.  

<!-- 
<br>
<div align="center">
<img src="../imgs/C%2B%2B/img23.jpg" height="60%" width="60%">
</div>
<br> -->

### Syntax
1. IN the switch statement a value/number is passed in the place of parameter and that case will execute which is equal to the value/number.
2. If no case matched with parameter then default case will execute. 
		

### Example
```
		#include<iostream>
		int main()
		{
			// Assigning parameter;s value 
			int p=2;
			switch(p)
			{
				case 1:
				cout<<"it is case 1";
				break;
				case 2:
				cout<<"it is case 2";
				break;
				case 3:
				cout<<"it is case 3";
				break;
				default:
				cout<<""no case matched";
			}
			return 0;
			
		}


		/*
		### Output ###
		it is case 2 	// because p=2 so case 2 will execute
		*/
```
	<!-- <a href="##">Click for Practical Program</a> -->
