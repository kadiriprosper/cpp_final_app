- **Definition**
  

	1. File handling is mechanism to store the output of a program into a file and read from the file on the disk permanently

	2. `fstream` header file is used to perform file operator in C++, this header file provides many classes `(ifstream, ofstream, fstream)` to read from a file and write into a file

	3. **ofstream:** This data type represenets the output file stream and is used to create files and to write information to files

	4. **ifstream:** This data type represents the input file stream and is used to read information from files

	5. **fstream:** This data type represents the file stream generally, and has the capabilities of both `ofstream` and `ifstream` which means it can create files, write information to files, and read information from files.






- **Operation on File**


	1. Opening of file
	2. Writing into a file
	3. Appending data into a file
	4. Reading from a file
	5. Closing of file




- **File Opening Modes**
  

	- In C++ File can be open in different mode to perform read and write operation on a file.
	- `open()` function is used to open a file 
	- open functions takes two arguments
	`open(const char *filename, ios::openmode mode);`
	- Different file opening mode is given below:

	    <br>
	    <div align="center">
        <img src="../imgs/C++/img42.jpg" height="60%" width="60%">
	    </div>
	    <br>




<br>

- **Writing into a file**

	```
	#include <iostream>
	#include <fstream>
	using namespace std;
	int main() {
		ofstream ofile; 	// making object of class ofstream
		ofile.open("easy.txt"); 	// open "easy.txt" for writing data

		// write to a file
		ofile << "Nemonet TYP" << end1;
		ofile << "An ISO 9001:2023 Certified Programmer" << end1;
		ofile.close(); 	// close the file
		return 0;
	}

	```


<br>

- **Reading from a file**


	```
	#include <iostream>
	#include <fstream>
	using namespace std;
	int main() 
	{
		char str[100]; 	// Declaring variables to store data from file
		ifstream ifile; 	// making object of class ifstream
		ifile.open("easy.txt"); 	// open "easy.txt" for reading
		cout << "Content of easy.txt file is given below :-"<<end1;

		// while the end of file [ eof() ] is not reached
		while (!ifile.eof()) {
			ifile.getline(str, 100); 	// read a line from file
			cout << str << end1; 	// print the file content
		}
		ifile.cose(); 	// close the file
	}

	```

<br>


- **Example: Count number of alphabet in a file**
  

	```
	#include <iostream>
	#include <fstream>
	using namespace std;
	int main() 
	{
		ifstream fin("easy.txt");
			char ch;
			int i,alpha=0;
			while(fin)
			{
				fin.get(ch);
				i=ch;
				if((i >=65 && i <=90) || (i >=97 && i <=122))
				alpha++;
			}
			cout<<"\n No. of alphabelt in easy.txt file : "<<alpha;
	}

	/* 
	easy.txt must exist in your system
	*/

	```

<br>

- **Example: Count number of digits in a file**
  

	```
	#include <iostream>
	#include <fstream>
	using namespace std;
	int main() 
	{
		ifstream fin("easy.txt");
			char ch;
			int i,digit=0;
			while(fin)
			{
				fin.get(ch);
				i=ch;
				if(i >=48 && i <=57)
				dgit++;
			}
			cout<<"\n No. of digits in easy.txt file : "<<digit;
	}

	/* 
	easy.txt must exist in your system
	*/

	```

<br>

- **Example: Count number of special symbol in a file**
  

	```
	#include <iostream>
	#include <fstream>
	using namespace std;
	int main() 
	{
		ifstream fin("easy.txt");
			char ch;
			int i,ss=0;
			while(fin)
			{
				fin.get(ch);
				i=ch;
				if((i >=65 && i <=90) || (i >=97 && i <=122))
				{}
				else if(i >=48 && i <=57)
				{}
				else
				ss++;
			}
			cout<<"\n No. of special symbol in easy.txt file : "<<ss;
	}

	/* 
	easy.txt must exist in your system
	*/

	```

<br>


- **Example: Count number of space in a file**
  

	```
	#include <iostream>
	#include <fstream>
	using namespace std;
	int main() 
	{
		ifstream fin("easy.txt");
			char ch;
			int i,space=0;
			while(fin)
			{
				fin.get(ch);
				i=ch;
				if(ch=='')
				space++;
			}
			cout<<"\n No. of space in easy.txt file : "<<space;
	}

	/* 
	easy.txt must exist in your system
	*/

	```

