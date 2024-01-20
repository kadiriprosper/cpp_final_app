## File Handling in C

In this type of programming we can perform different types of operation on file and operation result is stored in the file permanently.


### Mainly 2 types of file on which we perform operation
1. Text File
2. Binary File


### Text File
1. This type of file can be created using Notepad or other simple editors.
2. The extension of text file is (.txt)
3. This file contains simple text

### Binary File
1. This file contains information in the form of binary code (0 or 1).
2. The extension of binary file is (.bin)
3. This file is not redable


### Operations on File
1. Opening of file
2. Closing of file
3. Reading from file
4. Writing into file
5. Appending data into file


### Mode of Operation

![](resource:assets/images/C/img-b37.png)


### Some important function

![](resource:assets/images/C/img-b38.png)

### Writing into a file
Note: Before the execution of this program go to C Drive and create a temp folder, if it does not exist.

```
#include <stdio.h>
int main() 
{
	FILE *fp;
	fp=fopen("/temp/demo.txt","w");
	fprintf(fp, "Hello friends, how are you???.");
	fclose(fp);
}

	
### Output ###

/* After compiling and executing 
this program go to c drive,
open temp folder you will see
a text file(demo.txt) now open it,
the content of this file is
*/

Hello friends, how are you???
```

### Reading from a file
```
#include <stdio.h>
int main() 
{
	FILE *fp;
	char msg[200];
	fp=fopen("/temp/demo.txt","r"); 	// Opening the file in the reading mode
	fgets(msg,200,fp);
	printf("%s",msg);
	fclose(fp); 	//closing the file
}


/*
### Output ###

Hello friends, how are you???
*/
```

![](resource:assets/images/C/img-b39.png)

### Example: Count number of alphabet in a file
```
#include <stdio.h>
#include <ctype.h>

int main() {
	FILE *file;
	char filename[100];
	char ch;
	int alphabetCount = 0;

	printf("Enter the filename: ");
	scanf("%s", filename);

	// Open the file
	file = fopen(filename, "r");

	// Check if the file exists
	if (file == NULL) {
		printf("File not found or unable to open.\n");
		return 1;
	}

	// Read characters from the file
	while ((ch = fgetc(file)) != EOF) {
		// Check if the character is an alphabet
		if (isalpha(ch)) {
			alphabetCount++;
		}
	}

	// Close the file
	fclose(file);

	// Print the count of alphabetic characters
	printf("Number of alphabetic characters in the file: %d\n", alphabetCount);

	return 0;
}

/* 
easy.txt must exist in your system
*/
```

### Example: Count number of digits in a file
```
#include <stdio.h>
#include <ctype.h>

int main() {
	FILE *file;
	char filename[100];
	char ch;
	int digitCount = 0;

	printf("Enter the filename: ");
	scanf("%s", filename);

	// Open the file
	file = fopen(filename, "r");

	// Check if the file exists
	if (file == NULL) {
		printf("File not found or unable to open.\n");
		return 1;
	}

	// Read characters from the file
	while ((ch = fgetc(file)) != EOF) {
		// Check if the character is a digit
		if (isdigit(ch)) {
			digitCount++;
		}
	}

	// Close the file
	fclose(file);

	// Print the count of digits
	printf("Number of digits in the file: %d\n", digitCount);

	return 0;
}

/* 
easy.txt must exist in your system
*/
```

### Example: Count number of special symbol in a file
```
#include <stdio.h>
#include <ctype.h>

int main() {
	FILE *file;
	char filename[100];
	char ch;
	int specialSymbolCount = 0;

	printf("Enter the filename: ");
	scanf("%s", filename);

	// Open the file
	file = fopen(filename, "r");

	// Check if the file exists
	if (file == NULL) {
		printf("File not found or unable to open.\n");
		return 1;
	}

	// Read characters from the file
	while ((ch = fgetc(file)) != EOF) {
		// Check if the character is a special symbol
		if (!isalnum(ch) && !isspace(ch)) {
			specialSymbolCount++;
		}
	}

	// Close the file
	fclose(file);

	// Print the count of special symbols
	printf("Number of special symbols in the file: %d\n", specialSymbolCount);

	return 0;
}

/* 
easy.txt must exist in your system
*/
```

### Example: Count number of space in a file
```
#include <stdio.h>

int main() {
	FILE *file;
	char filename[100];
	char ch;
	int spaceCount = 0;

	printf("Enter the name of the file: ");
	scanf("%s", filename);

	// Open the file in read mode
	file = fopen(filename, "r");

	// Check if the file opened successfully
	if (file == NULL) {
		printf("Unable to open the file.\n");
		return 1;
	}

	// Read the file character by character and count spaces
	while ((ch = fgetc(file)) != EOF) {
		if (ch == ' ') {
			spaceCount++;
		}
	}

	// Close the file
	fclose(file);

	printf("The number of spaces in the file is: %d\n", spaceCount);

	return 0;
}

/* 
easy.txt must exist in your system
*/
```