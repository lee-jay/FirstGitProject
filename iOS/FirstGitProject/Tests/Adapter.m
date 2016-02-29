//
//  Adapter.m
//  FirstGitProject
//
//  Created by LiJun on 2/5/16.
//  Copyright © 2016. All rights reserved.
//

#import "Adapter.h"
#import "StopableThread.h"

BOOL kRunAlways = YES;

@interface Adapter()

@property(nonatomic, retain) /*volatile */StopableThread *worker;
@property(nonatomic, retain) UIView *view;

@end

@implementation Adapter

- (CFRunLoopRef)getTaskRunLoop {
    return [_worker getTaskRunLoop];
}

/**
 *
 */
- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        self.view = view;
    }
    
    return self;
}

//@Override
- (void)doStart {//protected void doStart() throws Exception {
    self.worker = [StopableThread start:@"chart.render" runnable:(id)self];
}

//@Override
- (long)doStop:(long)timeout unit:(TimeUnit)unit {
    return [StopableThread stop:_worker timeout:timeout unit:unit];
}
/**
 *
 */
//@Override
- (void)run {
    //
    @try {
        static NSInteger aaa;
        NSLog(@"aaa=%ld", aaa++);
        CFRunLoopRun();
        
    } @catch(NSException *throwable1) {
        NSLog(@"[render]failed to poll %@", throwable1);
        return;
    }
}

@end
