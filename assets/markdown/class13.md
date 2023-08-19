<details><summary><b>Structure in C++</b></summary>

  - <details><summary><b>Structure </b></summary>

    - **Definition**
  
	   1. It is a collection of data of different data type
	   2. It is a user define data type
	   3. Data can be of `int, char, float, double` etc data type
	   4. We can access the member of structure by making the variable of structure
	   5. `struct` keyword is used to create a structure


    - **Syntax**

		<br>
	    <div align="center">
        <img src="../imgs/C++/img39.jpg" height="60%" width="60%">
	    </div>
	    <br>

    - **Example:**

		```

			struct student
			{
				char name[200];
				int rollno;
				float marks;
			};

		```

		Here: 
    	1. student is the name of structure
    	2. struct is a keyword


    - **Example:- Write a program to store and display the student name, rollno and marks**


		```

			#include <iostream.h>
			#include <string.h>
			struct student
			{
				char name[200];
				int rollno;
				float marks;
			};
			int main()
			{
				struct student student1; 	// declaring structure variable
				strcpy(student1.name,"Nemo");
				student1.rollno=201;
				student1.marks=85.9;
					cout<<"Student Name="<<student1.name<<"\n";
					cout<<"Student Rollno="<<student1.rollno<<"\n";
					cout<<"Student Marks="<<student1.marks<<"\n";
			}
		
	
			### output ###
			Student Name=Nemo
			Student Rollno=201
			Student Marks=85.9

		```


	<a href="##">Click for Practical Program</a>

  	</details>


  - <details><summary><b>Union</b></summary>

	- **Definition**
  
	   1. It is a collection of data of different data type
	   2. It is a user define data type
	   3. Data can be of `int, char, float, double` etc data type
	   4. We can access the member of union by making the variable of union
	   5. `union` keyword is used to create a union
	   6. **Note:** Union does not support multiple value simultaneously. <br> It can only store one value at a time.


    - **Syntax**

		<br>
	    <div align="center">
        <img src="../imgs/C++/img40.jpg" height="60%" width="60%">
	    </div>
	    <br>


		

    - **Example:**

		```

			union student
			{
				char name[200];
				int rollno;
				float marks;
			};

		```

		Here: 
    	1. student is the name of union
    	2. union is a keyword


    - **Example:- Write a program to store and display the student name, rollno and marks**

		**Note:** 
		- Union will show only one last value correct cause it can store only single value at a time
		- I am writing this program here so you can understsand difference b/w structure and union better


		```

			#include <iostream.h>
			#include <string.h>
			union student
			{
				char name[200];
				int rollno;
				float marks;
			};
			int main()
			{
				union student student1; 	// declaring structure variable
				strcpy(student1.name,"Nemo");
				student1.rollno=201;
				student1.marks=85.9;
					cout<<"Student Name="<<student1.name<<"\n";
					cout<<"Student Rollno="<<student1.rollno<<"\n";
					cout<<"Student Marks="<<student1.marks<<"\n";
			}
		
	
			### output ###
			Student Name=garbage value
			Student Rollno=garbage value
			Student Marks=85.9

		```


	<a href="##">Click for Practical Program</a>
	
  

    </details>

  - <details><summary><b>Enumeration</b></summary>
  
    - **Definition**
  
	   1. It is a collection of named integer constant
	   2. It is a user define data type
	   3. `enum` keyword is used to create a enumeration
	   4. **Note:** Union does not support multiple value simultaneously. <br> It can only store one value at a time.


    - **Syntax**

		<br>
	    <div align="center">
        <img src="../imgs/C++/img41.jpg" height="60%" width="60%">
	    </div>
	    <br>

    - **Example:**

		```

			enum week {sunday,monday,tuesday,wednesday,thursday,friday,saturday};

		```

		Here: 
    	1. enum is a keyword
    	2. week is the name of union and its a user defined data type
    	3. sunday,monday,tuesday,wednesday,thursday,friday,saturday are the values of enum


	- **Default numerical value of the member of enum is given below:**

		- Default value of sunday is 0
		- Default value of monday is 1
		- Default value of tuesday is 2
		- Default value of wednesday is 3
		- Default value of thursday is 4
		- Default value of friday is 5
		- Default value of saturday is 6

		for better understanding, see the below example:


    - **Example 1:-**

		

		```

			#include <iostream.h>
			using namespace std;
			enum week {sunday,monday,tuesday,wednesday,thursday,friday,saturday};
			int main()
			{
				enum week obj;
				obj=wednesday;
				cout<<"Value of wenesday"<<obj;
			}
			
	
			### output ###
			Value of wenesday=3
			

		```



	- **Example:- We can aslo change the default value of member of enum**

		

		```

			#include <iostream.h>
			using namespace std;
			enum week {sunday=20,monday=50,tuesday=18,wednesday=95,thursday=84,friday=60,saturday=55};
			int main()
			{
				enum week obj;
				obj=wednesday;
				cout<<"Value of wenesday"<<obj;
			}
			
	
			### output ###
			Value of wenesday=95
			

		```




	<a href="##">Click for Practical Program</a>
   
   
   
   </details>


</details>
