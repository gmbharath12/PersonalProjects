//
//  main.m
//  Knapsack
//
//  Created by Bharath G M on 10/20/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

//int noOfItems = 3;
//
////int w[] = {3,1,2,4,6};
////
////int v[] = {7,2,1,6,1};
//
//int v[] = {60, 100, 120};
//int w[] = {10, 20, 30};
//
//
//int maximum(int a, int b)
//{
//    return a>b ? a:b;
//}
//
//int KS(int capacity, int i)
//{
//    if (i > noOfItems) return 0;
//    
//    if (capacity < w[i]) return KS(capacity, i+1);
//    
//    else
//        return maximum(KS(capacity, i+1), v[i]+KS(capacity - w[i], i+1));
//}
//
//int main(int argc, const char * argv[]) {
//
//    int capacity = 50;
//    int i = 1;
//    int optimalValue = KS(capacity, i);
//    printf("Optimal Value = %d", optimalValue);
//    return 0;
//}


/* A Naive recursive implementation of 0-1 Knapsack problem */
#include<stdio.h>

// A utility function that returns maximum of two integers
int max(int a, int b) { return (a > b)? a : b; }

// Returns the maximum value that can be put in a knapsack of capacity W
int knapSack(int W, int wt[], int val[], int n)
{
    // Base Case
    if (n == 0 || W == 0)
        return 0;
    
    // If weight of the nth item is more than Knapsack capacity W, then
    // this item cannot be included in the optimal solution
    if (wt[n-1] > W)
        return knapSack(W, wt, val, n-1);
    
    // Return the maximum of two cases: (1) nth item included (2) not included
    else return max( val[n-1] + knapSack(W-wt[n-1], wt, val, n-1),
                    knapSack(W, wt, val, n-1)
                    );
}

// Driver program to test above function
int main()
{
    int val[] = {60, 100, 120};
    int wt[] = {10, 20, 30};
    int  W = 50;
    int n = sizeof(val)/sizeof(val[0]);
    printf("%d", knapSack(W, wt, val, n));
    return 0;
}
