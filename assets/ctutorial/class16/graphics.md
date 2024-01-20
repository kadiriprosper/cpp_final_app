## Graphics in C

In this type of programming, we can draw different kinds of geometrical shape.

For example: Circle, Ectangle, Square, Line etc... in diffirent color.


### Initialization of Graph

```
void initgraph(int
*Graphics_driver, int
*Graphics_mode, char
*Driver_directory_path);
```

### `initgraph` 
1. Is a predefined function which is used to initialize the graph.
2. It has 3 parameters
3. Its loads the passed graphics driver then changes the system into graphics mode


### `Graphics_driver`
1. It specifies the graphics driver
2. It is set to DETECT

### `Graphics_mode`
1. It specifies graphics mode

### `Driver_directory_path`
1. It specifies the directory where all th grphics driver files are lcated


### Example: Write a program to draw a circle

Syntax-> `circle(from-left,from-top,radius)`

```
#include<stdio.h>
#include<graphics.h>
#include<conio.h>
int main()	{
	clrsrc();
	int gd = DETECT, gm;
	initgraph(&gd,&gm, "C:\\tc\\bgi"); 	//initialization of graphics mode
	cricle(150,200,50);
	getch();
	closegraph(); 	//closing graphic mode
}


/*
1.	 150 is the distance of center of circlefrom the left of the screen
2. 	 200 is the distance of center of circlefrom the top of the screen
3. 	 50 is the radius of the circle
*/
```

### Output 

![](resource:assets/images/C/img-b40.png)


### Example: Write a program to draw a line

Syntax-> `line(min-x,min-y,max-x,max-y)`

```
#include <stdio.h>
#include <graphics.h>
#include <conio.h>

int main() {
	int gd = DETECT, gm;
	initgraph(&gd, &gm, "C:\\tc\\bgi"); // Initialize graphics mode

	// Check if the graphics mode was initialized successfully
	if (graphresult() != 0) {
		printf("Graphics initialization failed!\n");
		return 1; // Exit with an error code
	}

	// Draw a line from (150, 150) to (250, 250)
	line(150, 150, 250, 250);

	getch(); // Wait for a key press
	closegraph(); // Close the graphics mode

	return 0; // Exit the program
}
```

### Output

![](resource:assets/images/C/img-b41.png)



### Example: Write a program to draw a rectangle

Syntax-> `rectangle(min-x,min-y,max-x,max-y)`


```
#include <stdio.h>
#include <graphics.h>
#include <conio.h>

int main() {
	int gd = DETECT, gm;
	initgraph(&gd, &gm, "C:\\tc\\bgi"); // Initialize graphics mode

	// Check if the graphics mode was initialized successfully
	if (graphresult() != 0) {
		printf("Graphics initialization failed!\n");
		return 1; // Exit with an error code
	}

	// Draw a rectangle with top-left corner (100, 100) and bottom-right corner (300, 200)
	rectangle(100, 100, 300, 200);

	getch(); // Wait for a key press
	closegraph(); // Close the graphics mode

	return 0; // Exit the program
}
```


### Output ###

![](resource:assets/images/C/img-b42.png)