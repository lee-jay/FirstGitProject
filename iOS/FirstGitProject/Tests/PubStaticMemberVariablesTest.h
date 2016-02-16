//
//  PubStaticMemberVariablesTest.h
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PubStaticMemberVariablesTest : NSObject

+ (PubStaticMemberVariablesTest *)A;
+ (PubStaticMemberVariablesTest *)B;
+ (PubStaticMemberVariablesTest *)byte:(Byte)byte name:(NSString *)name;
+ (NSDictionary<NSNumber *, PubStaticMemberVariablesTest *> *)getAll;

@end
