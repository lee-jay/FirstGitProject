//
//  ARCObject.m
//  FirstGitProject
//
//  Created by LiJun on 3/11/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "ARCObject.h"

@interface ARCObject() {
    NSString *_name;
    UIColor *_color;
    NSMutableArray *_names;
    NSMutableArray *_colors;
}

@end

@implementation ARCObject

- (void)dealloc {
    
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _names = [[NSMutableArray alloc] initWithCapacity:0];
        _colors = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return self;
}

- (NSString *)getName {
    return _name;
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (UIColor *)getColor {
    return _color;
}

- (void)setColor:(UIColor *)color {
    _color = color;
}

- (NSArray<NSString *> *)getNames {
    return _colors;
}

- (void)setNames:(NSArray<NSString *> *)names {
    [_names removeAllObjects];
    [_names setArray:names];
}

- (NSArray<UIColor *> *)getColors {
    return _colors;
}

- (void)setColors:(NSArray<UIColor *> *)colors {
    [_colors removeAllObjects];
    [_colors setArray:colors];
}

- (NSString *)description {
    return [NSStringFromClass(self.class) stringByAppendingFormat:@"[name=%@ color=%@ names=%@ colors=%@]",
            _name,
            _color,
            _names,
            _colors];
}

@end
