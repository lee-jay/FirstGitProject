//
//  BaseViewController
//
//  Created on 13-11-11.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

/**
 * 从xib文件加载
 */
+ (instancetype)viewControllerFromNib {
    return [[self alloc] initWithNibName:NSStringFromClass(self) bundle:nil];
}

#pragma mark -
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0){
#if __IPHONE_7_0
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = YES;
        self.automaticallyAdjustsScrollViewInsets = NO;
#endif
    }

    self.navigationController.navigationBar.translucent = YES;
}

/**
 *  判断是否为根Controller
 */
- (BOOL)isRootController
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *rootViewController = [viewControllers objectAtIndex:0];
    return (self == rootViewController);
}

/**
 *  判断是否为当前Controller
 */
- (BOOL)isCurrentController
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *currentViewController = [viewControllers lastObject];
    return (self == currentViewController);
}

@end
