//
//  main.m
//  TestRecursion
//
//  Created by Bharath G M on 1/4/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>

int foo()
{
    while (1)
    {
        return foo();
    }
    
}

int main(int argc, const char * argv[])
{
    return foo();
}
