//
//  Adapter.h
//  FirstGitProject
//
//  Created by LiJun on 2/5/16.
//  Copyright © 2016. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StopableThread.h"

@interface Adapter : NSObject//NSRunLoop

- (CFRunLoopRef)getTaskRunLoop;

/**
 *
 */
- (instancetype)initWithView:(UIView *)view;

//@Override
- (void)doStart;
//@Override
- (long)doStop:(long)timeout unit:(TimeUnit)unit;
/**
 *
 */
//@Override
- (void)run;

@end
