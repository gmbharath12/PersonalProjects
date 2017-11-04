//
//  main.m
//  Dup
//
//  Created by Bharath G M on 1/29/16.
//  Copyright (c) 2016 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>

void printRepeating(int arr[3], int size)
{
    int i;
    arr[5] = 12;
    NSLog(@"\n %d", (arr[5]));

    for(i = 0; i < size; i++)
    {
        if(arr[abs(arr[i])] > 0)
        {
            arr[abs(arr[i])] = -arr[abs(arr[i])];
            //            printf(" %d ", abs(arr[i]));
//            NSLog(@"\n %d", (arr[i]));
            
        }
        else
        {
            printf(" %d ", abs(arr[i]));
        }
    }
}

int main()
{
    int arr[3] = {5,1,5};
    int arr_size = sizeof(arr)/sizeof(arr[0]);
    printRepeating(arr, arr_size);
    getchar();
    return 0;
}




