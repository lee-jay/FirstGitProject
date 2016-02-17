//
//  JavaEnumClass2.h
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JavaEnumClass2;
extern JavaEnumClass2 *A;
extern JavaEnumClass2 *B;

@interface JavaEnumClass2 : NSObject<NSCopying>

+ (NSDictionary<NSNumber *, JavaEnumClass2 *> *)getAll;

@end

