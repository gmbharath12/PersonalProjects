//
//  main.m
//  ArrayHopp
//
//  Created by Bharath G M on 12/26/14.
//  Copyright (c) 2014 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import <stdlib.h>

int minimumJumps(int arr[], int n)
{
    
    int *jumps = arr;  // jumps[0] will hold the result
    int min;
    
    // Minimum number of jumps needed to reach last element
    // from last elements itself is always 0
    jumps[n-1] = 0;
    
    int i, j;
    
    // Start from the second element, move from right to left
    // and construct the jumps[] array where jumps[i] represents
    // minimum number of jumps needed to reach arr[m-1] from arr[i]
    for (i = n-2; i >=0; i--)
    {
        // If arr[i] is 0 then arr[n-1] can't be reached from here
        if (arr[i] == 0)
            jumps[i] = INT_MAX;
        
        // If we can direcly reach to the end point from here then
        // jumps[i] is 1
        else if (arr[i] == n - i - 1)
        {
            jumps[i] = 1;
        }
        // Otherwise, to find out the minimum number of jumps needed
        // to reach arr[n-1], check all the points reachable from here
        // and jumps[] value for those points
        else
        {
            min = INT_MAX;  // initialize min value
            
            // following loop checks with all reachable points and
            // takes the minimum
            for (j = i+1; j < n && j <= arr[i] + i; j++)
            {
                if (min > jumps[j])
                {
                    min = jumps[j];
                }
            }
            
            // Handle overflow
            if (min != INT_MAX)
            {
                jumps[i] = min + 1;
            }
            else
                jumps[i] = min; // or INT_MAX
        }
    }
    
    return jumps[0];
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        int array[] =  {2,3,1,1,4}; //{ 5, 6, 0, 4, 2, 4, 1, 0, 0, 4}; //;
        int sizeArray = sizeof(array)/sizeof(array[0]);
        printf("Minimum number of jumps to reach end is %d ", minimumJumps(array, sizeArray));
        return 0;
    }
}
