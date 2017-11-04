//
//  main.c
//  MaximumRepeatingNo
//
//  Created by Bharath G M on 3/19/16.
//  Copyright © 2016 Bharath G M. All rights reserved.
//

#include <stdio.h>



// Returns maximum repeating element in arr[0..n-1].
// The array elements are in range from 0 to k-1
int maxRepeating(int* arr, int n, int k)
{
    // Iterate though input array, for every element
    // arr[i], increment arr[arr[i]%k] by k
    for (int i = 0; i< n; i++)
        arr[arr[i]%k] += k;
    
    for (int i = 0; i< n; i++)
        printf(" %d  ", arr[i]);

    // Find index of the maximum repeating element
    int max = arr[0], result = 0;
    for (int i = 1; i < n; i++)
    {
        if (arr[i] > max)
        {
            max = arr[i];
            result = i;
        }
    }
    
    /* Uncomment this code to get the original array back
     for (int i = 0; i< n; i++)
     arr[i] = arr[i]%k; */
    
    // Return index of the maximum element
    return result;
}

// Driver program to test above function
int main()
{
    int arr[] = {2, 0, 0, 5, 0, 4, 1, 7};
    int n = sizeof(arr)/sizeof(arr[0]);
    int k = 8;
    
   int max =  maxRepeating(arr, n, k);
    printf("repeated element %d \n", max);
    
    return 0;
}