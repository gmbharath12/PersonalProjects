//
//  main.m
//  CountingSort
//
//  Created by Bharath G M on 10/2/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

//n times square root of log of log n Best sorting algorithm so far!!

#import <Foundation/Foundation.h>
#define RANGE 1024

void countingSort(int a[], int range, int size)
{
    int count[range + 1];
    memset(count, 0, sizeof(count));
    
    for (int i = 0; i < size ; i++)
    {
        count[a[i]] = count[a[i]] + 1;
    }
    
    for (int i = 0; i < range; i ++)
    {
        for (int j = 0; j < count[i]; j++) {
            printf("\n %d",i);
        }
    }
}

int main(int argc, const char * argv[]) {

    int a[] = {2,5,3,0,2,3,0,3,90, 893, 90,80, 1000}; //{1, 4, 1, 2, 7, 5, 2};
    int size = sizeof(a)/sizeof(int);
    countingSort(a, RANGE, size);
    return 0;
}
