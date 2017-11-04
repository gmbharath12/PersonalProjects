//
//  main.c
//  LargestNumber
//
//  Created by Bharath G M on 9/14/13.
//  Copyright (c) 2013 Bharath G M. All rights reserved.
//

#include <stdio.h>
#include <math.h>
#include <limits.h>

void stringToInt(char *s)
{
    int nValue = 0;
    while (*s)
    {
        nValue = (nValue*10) + (*s - '0');
        s++;
    }
    printf("Integer value = %d \n",nValue);
}

void toFindHighestAndSecondHighestNumberInAnArray(int a[])
{
    int highestNumber = -INFINITY;
    int secondHighest = -INFINITY;
    int i;
    for ( i = 0; i < 5; i++)
    {
        if (a[i] > highestNumber)
        {
            secondHighest = highestNumber;
            highestNumber = a[i]; //prints the highest number
        }
        
        else if (a[i]>secondHighest)
        {
            secondHighest = a[i]; //prints the second highest number
        }
    }
    printf("Highest Number = %d\n",highestNumber);
    printf("Second Highest = %d\n", secondHighest);

    
}

void reverseStringUsingRecursion(char *s)
{
    if (*s)
    {
        reverseStringUsingRecursion(s+1);
        printf("%c",*s);
    }
}
int main(int argc, const char * argv[])
{

    int a[5] = {-1,0,-7,-5,-2};
    char *s = "bharathgm";
    toFindHighestAndSecondHighestNumberInAnArray(a);
    stringToInt("14");
    printf("Reversed string is: ");
    reverseStringUsingRecursion(s);
    printf("\nMax value of an Integer = %d", INT_MAX);
    printf("\nMin value = %d and Inifity = %f \n",INT_MIN,INFINITY);
}

