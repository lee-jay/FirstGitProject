//
//  ARCObject.h
//  FirstGitProject
//
//  Created by LiJun on 3/11/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ARCObject : NSObject

- (NSString *)getName;
- (void)setName:(NSString *)name;
- (UIColor *)getColor;
- (void)setColor:(UIColor *)color;

- (NSArray<NSString *> *)getNames;
- (void)setNames:(NSArray<NSString *> *)names;
- (NSArray<UIColor *> *)getColors;
- (void)setColors:(NSArray<UIColor *> *)colors;

@end
