<details><summary><b>Arrays in C++</b></summary>

  - <details><summary><b>Single Dimension Array </b></summary>

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






    </details>

  - <details><summary><b>Double Dimension Array </b></summary>

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
        <img src="../imgs/C++/img33.jpg" height="60%" width="60%">
	    </div>
	    <br>

		1. Here 'a' is the name of array
		2. 'int' is the data type of array
		3. Size of array is 3x3 means, we can store maximum of 9 values in this array


	  - **Initialization of array (method 1)**

		<br>
	    <div align="center">
        <img src="../imgs/C++/img34.jpg" height="60%" width="60%">
	    </div>
	    <br>


	  - **Initialization of array (method 2)**

		<br>
	    <div align="center">
        <img src="../imgs/C++/img35.jpg" height="60%" width="60%">
	    </div>
	    <br>

	  - **Printing of array element (method 1)**

		```

		#include<iostream>
		using namespace std;
		int main()
		{
			int a[3][3]={{10,20,30},{70,80,90},{40,50,60}};
			cout<<"value at a[0][0]="<<a[0][0]<<"\n";
			cout<<"value at a[0][1]="<<a[0][1]<<"\n";
			cout<<"value at a[0][2]="<<a[0][2]<<"\n";
			cout<<"value at a[1][0]="<<a[1][0]<<"\n";
			cout<<"value at a[1][1]="<<a[1][1]<<"\n";
			cout<<"value at a[1][2]="<<a[1][2]<<"\n";
			cout<<"value at a[2][0]="<<a[2][0]<<"\n";
			cout<<"value at a[2][1]="<<a[2][1]<<"\n";
			cout<<"value at a[2][2]="<<a[2][2]<<"\n";
			
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


	  - **Printing of array element using loop (method 2)**

		```

		#include<iostream>
		using namespace std;
		int main()
		{
			int a[3][3]={{10,20,30},{70,80,90},{40,50,60}};
			for(int i=0;i<=2;i++)
			{
				for(int j=0;j<=2;j++)
				{
					cout<<[i][j]<<" ";
				}
				cout<<"\n";
			}
		}


		/*
		### Output ###
		10 20 30
		70 80 90
		40 50 60

		*/

		```


	  - **User input in array using loop**

		```

		#include<iostream>
		using namespace std;
		int main()
		{
			int a[3][3];
			int i,j;
			cout<<"Enter 9 element one by one\n";
			for(int i=0;i<=2;i++)
			  for(int j=0;j<=2;j++)
			   cin>>a[i][j];
			cout<<"Element is given below\n";
			for(int i=0;i<=2;i++)
			{
				for(int j=0;j<=2;j++)
				{
					cout<<a[i][j]<<" ";
				}
				cout<<'\n";
			}
		}


		/*
		### Output ###
		Enter 9 element one by one
		5
		6
		5
		8
		7
		9
		3
		1
		5
		Element is given below
		5 6 5
		8 7 9
		3 1 5

		*/

		```




		<br>


		<a href="##">Click for Practical Program</a>


    </details>





</details>
