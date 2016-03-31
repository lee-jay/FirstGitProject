//
//  GlobalComparatorClass.h
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSComparisonResult (^ PublicComparator)(NSNumber *, NSNumber *);

@interface GlobalComparatorClass : NSObject

+ (PublicComparator)ASC;

+ (void)doTest;

@end
