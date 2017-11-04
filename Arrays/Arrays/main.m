//
//  main.m
//  Arrays
//
//  Created by Bharath G M on 1/2/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>

int getOddOccurrence(int ar[], int ar_size)
{
    int i;
    int res = 0;
    for (i=0; i < ar_size; i++)
        res = res ^ ar[i];
    
    return res;
}

// Program to find the two odd occurring elements
/* Prints two numbers that occur odd number of times. The
 function assumes that the array size is at least 2 and
 there are exactly two numbers occurring odd number of times. */
void printTwoOdd(int arr[], int size)
{
    int xor2 = arr[0]; /* Will hold XOR of two odd occurring elements */
    int set_bit_no;  /* Will have only single set bit of xor2 */
    int i;
    int x = 0, y = 0;
    
    /* Get the xor of all elements in arr[]. The xor will basically
     be xor of two odd occurring elements */
    for(i = 1; i < size; i++)
    {
        xor2 = xor2 ^ arr[i];
        printf("xor2 = %d",xor2);
    }
    
    
    /* Get one set bit in the xor2. We get rightmost set bit
     in the following line as it is easy to get */
    set_bit_no = xor2 & ~(xor2-1);
    
    /* Now divide elements in two sets:
     1) The elements having the corresponding bit as 1.
     2) The elements having the corresponding bit as 0.  */
    for(i = 0; i < size; i++)
    {
        /* XOR of first set is finally going to hold one odd
         occurring number x */
        if(arr[i] & set_bit_no)
            x = x ^ arr[i];
        
        /* XOR of second set is finally going to hold the other
         odd occurring number y */
        else
            y = y ^ arr[i];
    }
    
    printf("\n The two ODD elements are %d & %d ", x, y);
}


void squareRoot(int n)
{
}


bool isMajority(int *, int, int);

/* Function to find the candidate for Majority */
int findCandidate(int a[], int size)
{
    int maj_index = 0, count = 1;
    int i;
    for(i = 1; i < size; i++)
    {
        if(a[maj_index] == a[i])
            count++;
        else
            count--;
        if(count == 0)
        {
            maj_index = i;
            count = 1;
        }
    }
    
    printf("\n Maj_Index = %d Element = %d",maj_index,a[maj_index]);
    
    return a[maj_index];
}

/* Function to print Majority Element */
void printMajority(int a[], int size)
{
    /* Find the candidate for Majority*/
    int cand = findCandidate(a, size);
    
    /* Print the candidate if it is Majority*/
    if(isMajority(a, size, cand))
        printf(" %d ", cand);
    else
        printf("NO Majority Element");
}





/* Function to check if the candidate occurs more than n/2 times */
bool isMajority(int a[], int size, int cand)
{
    int i, count = 0;
    for (i = 0; i < size; i++)
        if(a[i] == cand)
            count++;
    if (count > size/2)
        return 1;
    else
        return 0;
}


void maximumSubArray(int a[], int n)
{
    int i, maxSoFar = 0, currentMax = 0;
    for (i = 0; i < n; i++)
    {
        currentMax = currentMax + a[i];
        if(currentMax < 0)
            currentMax = 0;
        else if (currentMax > 0 && maxSoFar < currentMax)
        {
            maxSoFar = currentMax;
        }
    }
    printf("Maximum Sub array = %d \n", maxSoFar);
}

//To find median
/* This function returns median of ar1[] and ar2[].
 Assumptions in this function:
 Both ar1[] and ar2[] are sorted arrays
 Both have n elements */
int getMedian(int ar1[], int ar2[], int n)
{
    int m1; /* For median of ar1 */
    int m2; /* For median of ar2 */
    
    /* return -1  for invalid input */
    if (n <= 0)
        return -1;
    
    if (n == 1)
        return (ar1[0] + ar2[0])/2;
    
    if (n == 2)
        return (max(ar1[0], ar2[0]) + min(ar1[1], ar2[1])) / 2;
    
    m1 = median(ar1, n); /* get the median of the first array */
    m2 = median(ar2, n); /* get the median of the second array */
    
    /* If medians are equal then return either m1 or m2 */
    if (m1 == m2)
        return m1;
    
    /* if m1 < m2 then median must exist in ar1[m1....] and ar2[....m2] */
    if (m1 < m2)
    {
        if (n % 2 == 0)
            return getMedian(ar1 + n/2 - 1, ar2, n - n/2 +1);
        else
            return getMedian(ar1 + n/2, ar2, n - n/2);
    }
    
    /* if m1 > m2 then median must exist in ar1[....m1] and ar2[m2...] */
    else
    {
        if (n % 2 == 0)
            return getMedian(ar1,ar2 + n/2 - 1, n - n/2 + 1);
        else
            return getMedian(ar1,ar2 + n/2, n - n/2);
    }
}

/* Function to get median of a sorted array */
int median(int arr[], int n)
{
    if (n%2 == 0)
        return (arr[n/2] + arr[n/2-1])/2;
    else
        return arr[n/2];
}

/* Utility functions */
int max(int x, int y)
{
    return x > y? x : y;
}

int min(int x, int y)
{
    return x > y? y : x;
}

/* Driver program to test above function */
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
//        int ar[] = {2, 3, 5, 4, 5, 2, 4, 3, 5, 2, 4, 4, 2};
//        int ar[] = {2,4,5,7,5,5,7,2,4};
//        int n = sizeof(ar)/sizeof(ar[0]);
//        printf("\n %d \n", getOddOccurrence(ar, n));
//        int arr[] = {4, 2, 4, 5, 2, 3, 3, 1};
//        printTwoOdd(arr, 8);
//
//        int a[] = {1, 3, 3, 1, 2, 2, 1};
//        printMajority(a, sizeof(a)/sizeof(a[0]));
        
        int a[] = {-2,-3,4,-1,-2,1,5,-3};
//          int a[]=  {-2,1,-3,4,-1,2,1,-5,4};
        maximumSubArray(a, sizeof(a)/sizeof(a[0]));
        
        
//    int ar1[] = {1, 2, 3, 4, 5};
//      int ar2[] =  {23,56,109,231,400};
//        int n1 = sizeof(ar1)/sizeof(ar1[0]);
//        int n2 = sizeof(ar2)/sizeof(ar2[0]);
//        if (n1 == n2)
//            printf("Median is %d", getMedian(ar1, ar2, n1));
//        else
//            printf("Doesn't work for arrays of unequal size");
        
        getchar();
        return 0;


    }
    return 0;
}
