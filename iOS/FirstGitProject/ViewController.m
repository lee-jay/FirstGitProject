//
//  ViewController.m
//  FirstGitProject
//
//  Created by JayLee on 16/1/15.
//  Copyright © 2016年 JayLee. All rights reserved.
//

#import "ViewController.h"
#import "PubComparatorTest.h"
#import "PubStaticMemberVariablesTest.h"//测试load方法

@interface ViewController ()

@property(nonatomic, retain) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.button setBackgroundImage:[[UIImage imageNamed:@"home_btn_order"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 23, 11, 24) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
    
//    //测试类对象的公用排序方法
//    [self doTestPubComparator];
    
    //测试load方法（见上方的#import处）
    //测试initialize方法
    NSLog(@"PubStaticMemberVariablesTest.A = %@", PubStaticMemberVariablesTest.A);
    NSLog(@"PubStaticMemberVariablesTest.B = %@", PubStaticMemberVariablesTest.B);
    PubStaticMemberVariablesTest *testObject = [PubStaticMemberVariablesTest byte:86 name:@"MyCustomValue"];
    NSLog(@"PubStaticMemberVariablesTest new instance = %@", testObject);
    NSLog(@"[PubStaticMemberVariablesTest getAll] = %@", [PubStaticMemberVariablesTest getAll]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Test Cases
- (void)doTestPubComparator {
    NSMutableArray *items = [NSMutableArray array];
    for (int i=0; i<20; i++) {
        NSInteger num = arc4random();
        [items addObject:[NSNumber numberWithInteger:num]];
        NSLog(@"init %ld", num);
    }
    NSLog(@"----------------------");
    NSArray *sortedItems = [items sortedArrayUsingComparator:PubComparatorTest.ASC];
    for (NSNumber *num in sortedItems) {
        NSLog(@"final %@", num);
    }
}

@end
