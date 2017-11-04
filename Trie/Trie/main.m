//
//  main.m
//  Trie
//
//  Created by Bharath G M on 9/18/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])

// Alphabet size (# of symbols)
#define ALPHABET_SIZE (26)
// Converts key current character into index
// use only 'a' through 'z' and lower case
#define CHAR_TO_INDEX(c) ((int)c - (int)'a')

// trie node
typedef struct trieNode trieNODE;
struct trieNode
{
    int value;
    trieNODE *children[ALPHABET_SIZE];
};

// trie ADT
typedef struct trie trieAbstractDataType;
struct trie
{
    trieNODE *root;
    int count;
};

// Returns new trie node (initialized to NULLs)
trieNODE *getNode(void)
{
    trieNODE *pNode = NULL;
    
    pNode = (trieNODE *)malloc(sizeof(trieNODE));
    
    if( pNode )
    {
        int i;
        
        pNode->value = 0;
        
        for(i = 0; i < ALPHABET_SIZE; i++)
        {
            pNode->children[i] = NULL;
        }
    }
    
    return pNode;
}

// Initializes trie (root is dummy node)
void initialize(trieAbstractDataType *pTrie)
{
    pTrie->root = getNode();
    pTrie->count = 0;
}

// If not present, inserts key into trie
// If the key is prefix of trie node, just marks leaf node
void insert(trieAbstractDataType *pTrie, char key[])
{
    int level;
    NSUInteger length = strlen(key);
    int index;
    trieNODE *pCrawl;
    
    pTrie->count++;
    pCrawl = pTrie->root;
    
    for( level = 0; level < length; level++ )
    {
        index = CHAR_TO_INDEX(key[level]);
        
        NSLog(@"Interger Index of Char %c is %d", key[level], index);
        
        if( !pCrawl->children[index] )
        {
            pCrawl->children[index] = getNode();
        }
        
        pCrawl = pCrawl->children[index];
    }
    
    // mark last node as leaf
    pCrawl->value = pTrie->count;
}

// Returns non zero, if key presents in trie
int search(trieAbstractDataType *pTrie, char key[])
{
    int level;
    NSUInteger length = strlen(key);
    int index;
    trieNODE *pCrawl;
    
    pCrawl = pTrie->root;
    
    for( level = 0; level < length; level++ )
    {
        index = CHAR_TO_INDEX(key[level]);
        
        if( !pCrawl->children[index] )
        {
            return 0;
        }
        
        pCrawl = pCrawl->children[index];
    }
    
    return (0 != pCrawl && pCrawl->value);
}

// Driver
int main()
{
    // Input keys (use only 'a' through 'z' and lower case)
    char keys[][8] = {"the", "a", "there", "answer", "any", "by", "bye", "their","hello"};
    trieAbstractDataType trie;
    
    char output[][32] = {"Not present in trie", "Present in trie"};
    
    initialize(&trie);
    
//    printf("Character Array size %lu", ARRAY_SIZE(keys));
    
    
    // Construct trie
    for(int i = 0; i < ARRAY_SIZE(keys); i++)
    {
//        NSLog(@"%s", keys[i]);
        insert(&trie, keys[i]);
    }
    
    // Search for different keys
    printf("%s --- %s\n", "the", output[search(&trie, "the")] );
    printf("%s --- %s\n", "these", output[search(&trie, "these")] );
    printf("%s --- %s\n", "their", output[search(&trie, "their")] );
    printf("%s --- %s\n", "thaw", output[search(&trie, "thaw")] );
    
    return 0;
}