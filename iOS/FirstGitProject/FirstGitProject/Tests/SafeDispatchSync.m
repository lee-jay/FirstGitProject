//
//  SafeDispatchSync.m
//  FirstGitProject
//
//  Created by LiJun on 4/8/16.
//  Copyright © 2016 JayLee. All rights reserved.
//
// from: http://www.dreamingwish.com/article/sync-task-safely.html

#import "SafeDispatchSync.h"

@implementation SafeDispatchSync

+ (void)scheduleTask01:(void(^)())task targetQueue:(dispatch_queue_t)queue timeOut:(float)seconds
{
    (seconds < 0.0) && (seconds = 0.0);
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_async(queue, ^{
        task();
        dispatch_semaphore_signal(sem);
    });
    
    if (dispatch_semaphore_wait(sem, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC))) != 0)
    {
        NSLog(@"dispatch timeout sync: time out!");
    }
    dispatch_release(sem);
}

@end
