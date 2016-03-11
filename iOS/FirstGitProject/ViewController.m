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
#import "JavaEnumClass2.h"
#import "NSMutableMap.h"
#import "ARCObject.h"

#import "Adapter.h"
#import "StopableThread.h"

NSInteger kPriority = 10000;

@interface ViewController () {
    ARCObject *_memberArcObject;
}

@property(nonatomic, retain) IBOutlet UIButton *button;
@property(nonatomic, retain) Adapter *adapter;

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
    
    //测试全局枚举
    NSLog(@"A = %@", A);
    NSLog(@"B = %@", B);
    //测试设置对象作为NSDiction的键值
    NSLog(@"[JavaEnumClass2 getAll] = %@", [JavaEnumClass2 getAll]);
    
    //测试NSMutableMap
    [self doTestNSMutableMap];
    
    //测试浮点数精度
    NSLog(@"FLT_MANT_DIG: %d", FLT_MANT_DIG);
    NSLog(@"DBL_MIN: %d", DBL_MANT_DIG);
    NSLog(@"LDBL_MIN: %d", LDBL_MANT_DIG);
    
    NSLog(@"DECIMAL_DIG: %d", DECIMAL_DIG);
    
    NSLog(@"FLT_DIG: %d", FLT_DIG);
    NSLog(@"DBL_DIG: %d", DBL_DIG);
    NSLog(@"LDBL_DIG: %d", LDBL_DIG);
    
    NSLog(@"FLT_MIN_EXP: %d", FLT_MIN_EXP);
    NSLog(@"DBL_MIN_EXP: %d", DBL_MIN_EXP);
    NSLog(@"LDBL_MIN_EXP: %d", LDBL_MIN_EXP);
    
    NSLog(@"FLT_MIN_10_EXP: %d", FLT_MIN_10_EXP);
    NSLog(@"DBL_MIN_10_EXP: %d", DBL_MIN_10_EXP);
    NSLog(@"LDBL_MIN_10_EXP: %d", LDBL_MIN_10_EXP);
    
    NSLog(@"FLT_MAX_EXP: %d", FLT_MAX_EXP);
    NSLog(@"DBL_MAX_EXP: %d", DBL_MAX_EXP);
    NSLog(@"LDBL_MAX_EXP: %d", LDBL_MAX_EXP);
    
    NSLog(@"FLT_MAX_10_EXP: %d", FLT_MAX_10_EXP);
    NSLog(@"DBL_MAX_10_EXP: %d", DBL_MAX_10_EXP);
    NSLog(@"LDBL_MAX_10_EXP: %d", LDBL_MAX_10_EXP);
    
    NSLog(@"FLT_MAX: %.e", FLT_MAX);
    NSLog(@"DBL_MAX: %.e", DBL_MAX);
    NSLog(@"LDBL_MAX: %Le", LDBL_MAX);
    
    NSLog(@"FLT_EPSILON: %.e", FLT_EPSILON);
    NSLog(@"DBL_EPSILON: %.e", DBL_EPSILON);
    NSLog(@"LDBL_EPSILON: %Le", LDBL_EPSILON);
    
    NSLog(@"FLT_MIN: %.e", FLT_MIN);
    NSLog(@"DBL_MIN: %.e", DBL_MIN);
    NSLog(@"LDBL_MIN: %Le", LDBL_MIN);
    
    //测试数组
    NSMutableArray<NSNumber *> *numbers = [[NSMutableArray alloc] initWithCapacity:0];
    @try {
        numbers[24] = @(10);
        numbers[74] = @(20);
        numbers[2] = @(30);
    }
    @catch (NSException *exception) {
        NSLog(@"测试数组 failed! exception=%@", exception);
    }
    @finally {
        NSLog(@"numbers=%@", numbers);
    }
    
    
    //测试CFRunLoop
    self.adapter = [[Adapter alloc] init];
    [_adapter doStart];
    
    //测试Autolayout+UIScrollView（见storyboard）
    
    //测试Runtime
    float a[] = {1.0, 2.0, 3.0};
    NSLog(@"a[]: %s", @encode(typeof(a)));
    NSLog(@"int **: %s", @encode(int **));
    NSLog(@"NSObject *: %s", @encode(NSObject *));
    
    //测试绘制
    @try {
        @try {
            CGFloat scale = [UIScreen mainScreen].scale;
            CGRect bounds = CGRectMake(0, 0, self.view.bounds.size.width*scale, self.view.bounds.size.height*scale);
            UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 2.0f);
//            CGContextRef context = UIGraphicsGetCurrentContext();
            CGPoint pt = CGPointMake(0, 0);
            NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:22.0f],
                                         NSForegroundColorAttributeName:[UIColor whiteColor]};
            [@"中华人民共和国成立了！！！！！！！" drawAtPoint:pt withAttributes:attributes];
        } @finally {
            UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            dispatch_async(dispatch_get_main_queue(), ^{
                self.view.layer.contents = (__bridge id _Nullable)(image.CGImage);
            });
            //if (canvas != nil) view.getHolder().unlockCanvasAndPost(canvas); // Commit
        }
    } @catch (NSException *exception) {
        NSLog(@"failed to render, exception: %@", exception);
    } @finally {
        
    }
    
    //ARC测试
    ARCObject *arcObject = [[ARCObject alloc] init];
    arcObject.name = @"AAAAAA";
    arcObject.color = [UIColor greenColor];
    arcObject.names = @[@"BBBBBB", @"CCCCCC"];
    arcObject.colors = @[[UIColor blueColor], [UIColor redColor]];
    NSLog(@"arcObject=%@", arcObject);
    _memberArcObject = [[ARCObject alloc] init];
    _memberArcObject.name = @"DDDDDD";
    _memberArcObject.color = [UIColor greenColor];
    _memberArcObject.names = @[@"EEEEEE", @"FFFFFF"];
    _memberArcObject.colors = @[[UIColor blueColor], [UIColor redColor]];
    NSLog(@"_memberArcObject=%@", _memberArcObject);

//    //测试打印变量名称
//    NSLog(@"%@", JavaEnumClass.A.name);
//    NSLog(@"%@", JavaEnumClass.B.name);
}

void performTask(void *info) {
    static NSInteger bbb;
    NSLog(@"aaa=%ld", bbb++);
}

- (IBAction)btnDidClick:(id)sender {
//    CFRunLoopSourceContext context = {0,(__bridge void *)(self),NULL,NULL,NULL,NULL,NULL,
//        NULL,
//        NULL,
//        performTask};
//    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, kPriority, &context);
//    kPriority--;
//    CFRunLoopAddSource([_adapter getTaskRunLoop], source, kCFRunLoopDefaultMode);
//    CFRelease(source);
    NSLog(@"_memberArcObject=%@", _memberArcObject);
    
    CFRunLoopStop([_adapter getTaskRunLoop]);
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

- (void)doTestNSMutableMap {
    NSMutableMap *map = [[NSMutableMap alloc] init];
    map[@"aaa"] = @"AAA";
    map[@"bbb"] = @"BBB";
    map[@"ccc"] = @"CCC";
    NSLog(@"%@", map);
    
    map[JavaEnumClass.A] = @"aaa";
    map[JavaEnumClass.B] = @"bbb";
    NSLog(@"%@", map);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[JavaEnumClass.A] = @"AAA";
    dict[JavaEnumClass.B] = @"BBB";
    NSLog(@"%@", dict);
}



@end
