//
//  GCDTestViewController.m
//  FirstGitProject
//
//  Created by LiJun on 4/8/16.
//  Copyright © 2016 JayLee. All rights reserved.
//
// from: http://www.dreamingwish.com/article/sync-task-safely.html

#import "GCDTestViewController.h"
#import "SafeDispatchSync.h"

@interface GCDTestViewController ()

@property(nonatomic, retain) dispatch_queue_t queueA;
@property(nonatomic, retain) dispatch_queue_t queueB;

@end

@implementation GCDTestViewController

- (void)dealloc {
    self.queueA = nil;
    self.queueB = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self foo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)taskR {
    printf("this is task R, do you copy?");
}

- (void)taskS {
    dispatch_sync(_queueA, ^{
        [self taskR];
    });
}

- (void)taskT {
    dispatch_sync(_queueB, ^{
        [self taskS];
    });
}

- (int)foo {
    self.queueA = dispatch_queue_create("queueA", 0);
    self.queueB = dispatch_queue_create("queueB", 0);
    
    //Safe dispatch sync
    [SafeDispatchSync scheduleTask01: ^{
        [self taskT];
    } targetQueue:_queueA timeOut:1.0f];
    
//    dispatch_sync(_queueA, ^{
//        //将会死锁
//        [self taskT];
//    });
    
    dispatch_release(_queueA);
    dispatch_release(_queueB);
    return 0;
}

@end
