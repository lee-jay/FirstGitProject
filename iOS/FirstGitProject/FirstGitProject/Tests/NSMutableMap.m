//
//  NSMutableMap.m
//  FirstGitProject
//
//  Created by LiJun on 2/22/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "NSMutableMap.h"

@interface NSMutableMap()

@property(nonatomic, retain) NSMutableDictionary *keysDict;
@property(nonatomic, retain) NSMutableDictionary *objectsDict;

@end

@implementation NSMutableMap

- (instancetype)init {
    self = [super init];
    if (self) {
        self.keysDict = [NSMutableDictionary dictionaryWithCapacity:0];
        self.objectsDict = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    return self;
}

- (NSUInteger)count {
    return [_keysDict count];
}

- (NSEnumerator *)keyEnumerator {
    return _keysDict.objectEnumerator;
}

- (NSEnumerator *)objectEnumerator {
    return _objectsDict.objectEnumerator;
}

- (id)objectForKey:(id)aKey {
    return [_objectsDict objectForKey:@([aKey hash])];
}

- (void)setObject:(id)anObject forKey:(id)aKey {
    [_keysDict setObject:aKey forKey:@([aKey hash])];
    [_objectsDict setObject:anObject forKey:@([aKey hash])];
}

@end
