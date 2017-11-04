//
//  main.m
//  Djb2Hash
//
//  Created by Bharath G M on 10/22/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//


//http://www.cse.yorku.ca/~oz/hash.html
//http://nshipster.com/equality/

#import <Foundation/Foundation.h>

unsigned long hash(char *str)
{
    unsigned long hash = 5381;
    int c;
    
    while ((c = *str++))
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
    
    return hash;
}

int main(int argc, const char * argv[]) {

    char* str1 = "Bharath";
    char* str2 = "Bharath";
    unsigned long hashValueStr1 = hash(str1);
    unsigned long hasValueStr2 = hash(str2);
    
    printf("Hash Value for Str1 = %lud \n", hashValueStr1);
    printf("Hash Value for Str1 = %lud \n", hasValueStr2);
    
    NSString* string1 = @"Bharath";
    NSString* string2 = @"Bharath";
    NSLog(@"String 1 Hash value %lu \n", (unsigned long)[string1 hash]);
    NSLog(@"String 2 Hash value %lu \n", (unsigned long)[string2 hash]);


    return 0;
}
