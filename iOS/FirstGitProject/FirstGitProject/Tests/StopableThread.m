//
//  StopableThread.m
//  FirstGitProject
//
//  Created by LiJun on 2/5/16.
//  Copyright © 2016. All rights reserved.
//

#import "StopableThread.h"

@interface StopableThread() {
    
}

@property(nonatomic, retain) NSRunLoop *runnable;
@property(nonatomic, assign) BOOL stopped;
@property(nonatomic, assign) CFRunLoopRef taskRunLoop;

@end

@implementation StopableThread

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _stopped = NO;
    }
    
    return self;
}

- (CFRunLoopRef)getTaskRunLoop {
    return _taskRunLoop;
}

/**
 *
 */
- (instancetype)initWithRunnable:(NSRunLoop *)runnable {
    self = [super init];
    if (self) {
        self.runnable = runnable;
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name runnable:(NSRunLoop*)runnable {
    self = [super init];
    if (self) {
        self.runnable = runnable;
        self.name = name;
    }
    
    return self;
}

/**
 *
 */
////////////////////
- (void)main {
    self.taskRunLoop = CFRunLoopGetCurrent();
    while(!self.stopped) {
        @try {
            CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
            [self.runnable run];
            //[pool release];
            CFRunLoopRemoveSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            CFRelease(source);
        } @catch (NSException *e) {
            break;
        }
    }
}

/**
 *
 */
- (long)stop:(long)timeout unit:(TimeUnit)unit {
    self.stopped = YES; [NSThread exit];
    return 0;
}

/**
 *
 */
+ (long)stop:(StopableThread *)thread timeout:(long)timeout unit:(TimeUnit)unit {
    return thread == nil ? timeout : [thread stop:timeout unit:unit];
}

+ (StopableThread *)start:(NSString *)name runnable:(NSRunLoop *)runnable {
    return [self start:name runnable:runnable start:YES daemon:NO];
}

+ (StopableThread *)start:(NSString *)name runnable:(NSRunLoop *)runnable start:(BOOL)start {
    return [self start:name runnable:runnable start:start daemon:NO];
}

+ (StopableThread *)start:(NSString *)name runnable:(NSRunLoop *)runnable start:(BOOL)start daemon:(BOOL)daemon {
    StopableThread *r = [[StopableThread alloc] initWithName:name runnable:runnable]; if(start) [r start]; return r;
}

@end
