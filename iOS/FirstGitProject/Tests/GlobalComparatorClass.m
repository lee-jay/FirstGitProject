//
//  GlobalComparatorClass.m
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "GlobalComparatorClass.h"

@implementation GlobalComparatorClass

//NSComparisonResult (^ XChartPainter_ASC)(NSNumber *, NSNumber *) = ^(NSNumber *a, NSNumber *b) {
//    return (NSComparisonResult)[a integerValue] - [b integerValue];
//};
+ (PublicComparator)ASC {
    return ^(NSNumber *a, NSNumber *b) {
        return (NSComparisonResult)[a integerValue] - [b integerValue];
    };
}

//Test Cases
+ (void)doTest {
    NSMutableArray *items = [NSMutableArray array];
    for (int i=0; i<20; i++) {
        NSInteger num = arc4random();
        [items addObject:[NSNumber numberWithInteger:num]];
        NSLog(@"init %ld", num);
    }
    NSLog(@"----------------------");
    NSArray *sortedItems = [items sortedArrayUsingComparator:GlobalComparatorClass.ASC];
    for (NSNumber *num in sortedItems) {
        NSLog(@"final %@", num);
    }
}

@end
