//
//  JavaEnumClass.m
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "JavaEnumClass.h"

static JavaEnumClass *A;
static JavaEnumClass *B;
static NSDictionary<NSNumber *, JavaEnumClass *> *INDEX;

@interface JavaEnumClass()

@property(assign, nonatomic) Byte value;
@property(assign, nonatomic) NSString *displayName;

@end

@implementation JavaEnumClass

+ (JavaEnumClass *)A {
    return A;
}

+ (JavaEnumClass *)B {
    return B;
}

+ (JavaEnumClass *)byte:(Byte)byte name:(NSString *)name {
    JavaEnumClass *area = [[JavaEnumClass alloc] init];
    area.value = byte;
    area.displayName = name;
    
    return area;
}

+ (void)load {
    NSLog(@"Class(%@) has loaded!", [self class]);
}

+ (void)initialize {
    A = [JavaEnumClass byte:(Byte)1 name:@"A"];
    B = [JavaEnumClass byte:(Byte)2 name:@"B"];
    
    INDEX = [NSDictionary dictionaryWithObjectsAndKeys:
             A, @(A.value),
             B, @(B.value),
             nil];
    
    NSLog(@"Class(%@) has initialized!", [self class]);
}

+ (NSDictionary<NSNumber *, JavaEnumClass *> *)getAll {
    return INDEX;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class(%@) value=%d, name=%@", NSStringFromClass([self class]), self.value, self.displayName];
}

@end
