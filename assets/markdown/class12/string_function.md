## Definition

1. Sring is a collection of character
2. C does not support string data type. Therefore char data type is used to make string
3. String in C is stored in single dimension character array
4. There are many predefined string function in C library
5. All the string functions are predefined in `string.h` header file

![Syntax](../imgs/C%2B%2B/img37.jpg)

### strlen(s)

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


### strcpy(s1,s2)

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


### strcmp(s1,s2)


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

### strcat(s1,s2)


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

### strrev(s)


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


### strupr(s)


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

### strlwr(s)


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