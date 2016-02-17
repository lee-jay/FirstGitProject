//
//  JavaEnumClass2.m
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "JavaEnumClass2.h"

JavaEnumClass2 *A;
JavaEnumClass2 *B;
static NSDictionary<NSNumber *, JavaEnumClass2 *> *INDEX;

@interface JavaEnumClass2()

@property(assign, nonatomic) Byte value;
@property(assign, nonatomic) NSString *displayName;

+ (JavaEnumClass2 *)byte:(Byte)byte name:(NSString *)name;

@end

@implementation JavaEnumClass2

+ (JavaEnumClass2 *)byte:(Byte)byte name:(NSString *)name {
    JavaEnumClass2 *area = [[JavaEnumClass2 alloc] init];
    area.value = byte;
    area.displayName = name;
    
    return area;
}

+ (void)load {
    NSLog(@"Class(%@) has loaded!", [self class]);
}

+ (void)initialize {
    A = [JavaEnumClass2 byte:(Byte)1 name:@"A"];
    B = [JavaEnumClass2 byte:(Byte)2 name:@"B"];
    JavaEnumClass2 *customInstance = [JavaEnumClass2 byte:23 name:@"MyCustomInstance"];
    
    INDEX = [NSDictionary dictionaryWithObjectsAndKeys:
             A, A,
             B, B,
             customInstance, customInstance,
             nil];
    
    NSLog(@"Class(%@) has initialized!", [self class]);
}

+ (NSDictionary<NSNumber *, JavaEnumClass2 *> *)getAll {
    return INDEX;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Class(%@) value=%d, name=%@", NSStringFromClass([self class]), self.value, self.displayName];
}

#pragma mark <NSCopying>
- (id)copyWithZone:(nullable NSZone *)zone {
    return @(self.value);
}

@end
