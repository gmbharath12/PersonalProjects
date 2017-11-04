//
//  main.c
//  Pointers
//
//  Created by Bharath G M on 2/14/16.
//  Copyright © 2016 Bharath G M. All rights reserved.
//

#include <stdio.h>
#include <malloc/malloc.h>


struct myStructure_t
{
    int *a;
    int *b;
};
typedef struct myStructure_t  myStructure_t;

void fooByPtr(myStructure_t *arg) {
    printf("addr inside foo before %p\n", arg);
    arg = (myStructure_t*) malloc(sizeof(myStructure_t));
    (arg)->a = 10;
    (arg)->b = 20;
    printf("addr inside foo after %p\n", arg);
}

int main() {
    myStructure_t *x = NULL;
    x = malloc(sizeof(myStructure_t));
    x->a = 10;
    x->b = 20;
    printf("x addr before = %p\n", x);
    fooByPtr(x);
    printf("x addr after = %p\n", x);
    return 0;
}

