//
//  PubComparatorTest.m
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "PubComparatorTest.h"

@implementation PubComparatorTest

//NSComparisonResult (^ XChartPainter_ASC)(NSNumber *, NSNumber *) = ^(NSNumber *a, NSNumber *b) {
//    return (NSComparisonResult)[a integerValue] - [b integerValue];
//};
+ (PublicComparator)ASC {
    return ^(NSNumber *a, NSNumber *b) {
        return (NSComparisonResult)[a integerValue] - [b integerValue];
    };
}

@end
