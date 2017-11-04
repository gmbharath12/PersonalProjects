//
//  main.m
//  ActivitySelection
//
//  Created by Bharath G M on 10/22/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>

void activitySelection(int start[], int finish[], int n)
{
    int i, j;
    
    i = 0;
    
    printf(" A%d \n",i+1);
    
    for (j = 1; j < n; j++)
    {
        if (start[j] >= finish[i])
        {
            printf(" A%d \n", j+1);
            i = j;
        }
    }
}

int main(int argc, const char * argv[])
{

//int s[] =     {1, 3, 0, 5, 3, 5, 6, 8, 8, 2, 12};
//int f[] =  {4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16};
    
    int s[] =   {1, 3, 0, 5, 8, 5};
    int f[] =  {2, 4, 6, 7, 9, 9};
    int n = sizeof(s)/sizeof(s[0]);
    activitySelection(s, f, n);

    return 0;
}
