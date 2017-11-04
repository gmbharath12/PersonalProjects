//
//  main.m
//  MinHeap2
//
//  Created by Bharath G M on 5/13/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

/**
 We can also use Min Heap for finding the k’th smallest element. Following is algorithm.
 1) Build a Min-Heap MH of the first k elements (arr[0] to arr[k-1]) of the given array. O(k)
 
 2) For each element, after the k’th element (arr[k] to arr[n-1]), compare it with root of MH.
 ……a) If the element is less than the root then make it root and call heapify for MH
 ……b) Else ignore it.
 // The step 2 is O((n-k)*logk)
 
 3) Finally, root of the MH is the kth smallest element.
 
 Time complexity of this solution is O(k + (n-k)*Logk)
 */

#import <Foundation/Foundation.h>
#include <stdio.h>

//no temp varaible is used
void swap(int *a, int *b)
{
    *a = *a + *b;
    *b = *a - *b;
    *a = *a - *b;
}

void minHeapify(int a[], int size, int i)
{
    int leftTree = 2*i+1;
    int rightTree = 2*i+2;
    int root = 2*i;
    
//    printf("\t Positions: Left -- %d, Root -- %d, Right -- %d \n ", leftTree, root, rightTree);
//    
//    printf("\t Left %d, Right %d and Root = %d \n", a[leftTree],a[rightTree],a[root]);
    
    if(leftTree < size && a[leftTree] < a[root])
    {
        swap(&a[root], &a[leftTree]);
    }
    if(rightTree < size && a[rightTree]<a[root])
    {
        swap(&a[root], &a[rightTree]);
    }
}


void buildMinHeap(int a[], int size)
{
    for(int i=size/2;i>=0;i--)
        minHeapify(a,size,i);
}


int kthLargest(int a[], int size, int k)
{
    int minHeap[k];
    int i;
    for(i=0;i<k;i++)
    {
        minHeap[i] = a[i];
    }
    buildMinHeap(minHeap,k);
    
    for(i=k;i<size;i++)
    {
        if(a[i]>minHeap[0])
        {
            minHeap[0]=a[i];
            minHeapify(minHeap,k,0);
        }
    }
    
////    printf("\n Root Element = %d", minHeap[0]);
//    printf("k largest elements \n ");
//    for (i = 0; i < k; i++)
//    {
//        //prints the min heap values which apparently will have k largest values.
//        //below example demonstrates for k(= 2 ) largest values.
//        printf("\n %d \n", minHeap[i]);
//    }
    //min value at the root
    return minHeap[0];
}

int main()
{
    int a[] = {10,6,7,8,4,2,3,5,1};
    int size = sizeof(a)/sizeof(a[0]);
    int k = 3;
    kthLargest(a,size,k);
    //    prints the kth largest element
        printf("kth largest element = %d ",kthLargest(a,size,k));
    getchar();
    return 0;
}
