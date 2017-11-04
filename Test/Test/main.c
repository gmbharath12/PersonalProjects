//
//  main.c
//  Test
//
//  Created by Bharath G M on 4/8/16.
//  Copyright © 2016 Bharath G M. All rights reserved.
//



#include <stdio.h>

#define min(a,b) a > b ? b:a

int findKthSmallestElement(int a[], int b[], int sizeA, int sizeB, int k){
    /* to maintain uniformaty, we will assume that size_a is smaller than size_b
     else we will swap array in call :) */
    if(sizeA > sizeB)
        return findKthSmallestElement(b, a, sizeB, sizeA, k);
    /* Now case when size of smaller array is 0 i.e there is no elemt in one array*/
    if(sizeA == 0 && sizeB >0)
        return b[k-1]; // due to zero based index
    
    /* case where K ==1 that means we have hit limit */
    if(k ==1)
        return min(a[0], b[0]);
    
    /* Now the divide and conquer part */
    int i =  min(sizeA, k/2) ; // K should be less than the size of array
    int j =  min(sizeB, k/2) ; // K should be less than the size of array
    
    if(a[i-1] > b[j-1])
        // Now we need to find only K-j th element
        return findKthSmallestElement(a, b+j, i, (sizeB-j), k-j);
    else
        return findKthSmallestElement(a+i, b, (sizeA-i), j, k-i);
    
    return -1;
}
int main(){
    int a[] = {1,2,3,4};
    int b[] = {5,6,7,8};
    
    int sizeA  = sizeof(a)/sizeof(a[0]);
    int sizeB  = sizeof(b)/sizeof(b[0]);
    
    printf("\n Kth smallest element is : %d \n", findKthSmallestElement(a,b,sizeA, sizeB, 3));
    return 0;
}



//#include <stdio.h>
//void reverse(char *str)
//{
//    char *str1 = str;
//    char *end = str;
//    char temp;
//    if (str)
//    {
//        while (*end)
//        {
//            ++end;
//        }
//        --end;
//        while (str1 < end)
//        {
//            temp = *str1;
//            *str1++ = *end;
//            *end-- = temp;
//        }
//        printf("Str = %s",str);
//    }
//}
//
//#include <stdio.h>
//#include <locale.h>
//
//void printfcomma2 (int n) {
//    if (n < 1000) {
//        printf ("%d", n);
//        return;
//    }
//    printfcomma2 (n/1000);
//    printf (",%03d", n%1000);
//}
//
//
//int main(void)
//{
//    printfcomma2(10000);
//    return 0;
//}
