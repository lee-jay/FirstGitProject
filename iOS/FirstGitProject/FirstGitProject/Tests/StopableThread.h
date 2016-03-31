//
//  StopableThread.h
//  FirstGitProject
//
//  Created by LiJun on 2/5/16.
//  Copyright © 2016. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TimeUnit) {
    TimeUnit_MilliSeconds,
    TimeUnit_Seconds,
};

@interface StopableThread : NSThread

- (CFRunLoopRef)getTaskRunLoop;

- (instancetype)initWithRunnable:(NSRunLoop *)runnable;
- (instancetype)initWithName:(NSString *)name runnable:(NSRunLoop *)runnable;

//@override
- (void)main;

/**
 *
 */
- (long)stop:(long)timeout unit:(TimeUnit)unit;

/**
 *
 */
+ (long)stop:(StopableThread *)thread timeout:(long)timeout unit:(TimeUnit)unit;
+ (StopableThread *)start:(NSString *)name runnable:(NSRunLoop *)runnable;
+ (StopableThread *)start:(NSString *)name runnable:(NSRunLoop *)runnable start:(BOOL)start;
+ (StopableThread *)start:(NSString *)name runnable:(NSRunLoop *)runnable start:(BOOL)start daemon:(BOOL)daemon;

@end
