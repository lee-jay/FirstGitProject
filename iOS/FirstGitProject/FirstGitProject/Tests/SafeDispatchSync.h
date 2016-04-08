//
//  SafeDispatchSync.h
//  FirstGitProject
//
//  Created by LiJun on 4/8/16.
//  Copyright © 2016 JayLee. All rights reserved.
//
// from: http://www.dreamingwish.com/article/sync-task-safely.html

#import <Foundation/Foundation.h>

@interface SafeDispatchSync : NSObject

+ (void)scheduleTask01:(void(^)())task targetQueue:(dispatch_queue_t)queue timeOut:(float)seconds;

@end
