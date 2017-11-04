//
//  main.m
//  WordBreak
//
//  Created by Bharath G M on 1/18/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <string.h>
bool dictionaryContainsWord(NSString* word)
{
    NSArray* dictionary = @[@"i", @"like", @"samsung"];
    
    if ([dictionary containsObject:word])
    {
        return true;
    }
    else
        return false;
    
}

bool wordBreak(NSString* string)
{
    for (int i = 0; i < [string length]; i++)
    {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
        NSLog(@"%@", [string substringFromIndex:i+1]);
        if (dictionaryContainsWord([string substringWithRange:NSMakeRange(0, i)]) && wordBreak([string substringWithRange:NSMakeRange(i, string.length-1)]))
        {
            return true;
        }
    }
    
  return false;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        // insert code here...
//        NSLog(@"Hello, World!");
        NSString* myString = @"ilikesamsung";
        bool myBool = wordBreak(myString);
        
        if (myBool)
        {
            printf("contains word");
        }
        else
            printf("doesn't contains word");
        
    }
    return 0;
}
