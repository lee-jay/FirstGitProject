//
//  PubStaticMemberVariablesTest.m
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "PubStaticMemberVariablesTest.h"

static PubStaticMemberVariablesTest *A;
static PubStaticMemberVariablesTest *B;
static NSDictionary<NSNumber *, PubStaticMemberVariablesTest *> *INDEX;

@interface PubStaticMemberVariablesTest()

@property(assign, nonatomic) Byte value;
@property(assign, nonatomic) NSString *displayName;

@end

@implementation PubStaticMemberVariablesTest

+ (PubStaticMemberVariablesTest *)A {
    return A;
}

+ (PubStaticMemberVariablesTest *)B {
    return B;
}

+ (PubStaticMemberVariablesTest *)byte:(Byte)byte name:(NSString *)name {
    PubStaticMemberVariablesTest *area = [[PubStaticMemberVariablesTest alloc] init];
    area.value = byte;
    area.displayName = name;
    
    return area;
}

+ (void)load {
    NSLog(@"Class(%@) has loaded!", [self class]);
}

+ (void)initialize {
    A = [PubStaticMemberVariablesTest byte:(Byte)1 name:@"A"];
    B = [PubStaticMemberVariablesTest byte:(Byte)2 name:@"B"];
    
    INDEX = [NSDictionary dictionaryWithObjectsAndKeys:
             A, @(A.value),
             B, @(B.value),
             nil];
    
    NSLog(@"Class(%@) has initialized!", [self class]);
}

+ (NSDictionary<NSNumber *, PubStaticMemberVariablesTest *> *)getAll {
    return INDEX;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class(%@) value=%d, name=%@", NSStringFromClass([self class]), self.value, self.displayName];
}

@end
