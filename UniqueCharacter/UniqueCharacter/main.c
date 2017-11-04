//
//  main.c
//  UniqueCharacter
//
//  Created by Bharath G M on 3/16/16.
//  Copyright © 2016 Bharath G M. All rights reserved.
//

#include<stdio.h>
#include<string.h>

int firstUniqueCharacter(char *str)
{
    int a[256]={0};

    int i;
    
    for(i=0;i<strlen(str);++i)
    {
        a[str[i]]++;
    }
    
    for(i=0;i<strlen(str);++i)
    {
        if( a[str[i]] == 1)
        {
            printf("First Repeating Character %c\n",str[i]);
            return 1;
        }
    }

   
    return -1;
    
}
int main()
{
    char *str = "Apple";
    int notUnique = firstUniqueCharacter(str);
    if (notUnique == -1) {
        printf("There's no unique character in a string");
    }
    return 0;
    
}