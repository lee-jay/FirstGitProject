//
//  JavaEnumClass.h
//  FirstGitProject
//
//  Created by LiJun on 2/15/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JavaEnumClass : NSObject<NSCopying>

+ (JavaEnumClass *)A;
+ (JavaEnumClass *)B;
+ (JavaEnumClass *)byte:(Byte)byte name:(NSString *)name;
+ (NSDictionary<NSNumber *, JavaEnumClass *> *)getAll;

//- (NSString *)name;

@end
