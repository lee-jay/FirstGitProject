//
//  ViewController.m
//  FirstGitProject
//
//  Created by JayLee on 16/1/15.
//  Copyright © 2016年 JayLee. All rights reserved.
//

#import "ViewController.h"
#import "GlobalComparatorClass.h"
#import "JavaEnumClass.h"//测试load方法

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
    NSLog(@"JavaEnumClass.A = %@", JavaEnumClass.A);
    NSLog(@"JavaEnumClass.B = %@", JavaEnumClass.B);
    JavaEnumClass *testObject = [JavaEnumClass byte:86 name:@"MyCustomValue"];
    NSLog(@"JavaEnumClass new instance = %@", testObject);
    NSLog(@"[JavaEnumClass getAll] = %@", [JavaEnumClass getAll]);
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
    NSArray *sortedItems = [items sortedArrayUsingComparator:GlobalComparatorClass.ASC];
    for (NSNumber *num in sortedItems) {
        NSLog(@"final %@", num);
    }
}

@end
