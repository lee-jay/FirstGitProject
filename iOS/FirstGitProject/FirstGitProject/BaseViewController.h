//
//  BaseViewController
//
//  Created on 13-11-11.
//
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController {
    
}

+ (instancetype)viewControllerFromNib;          //从xib文件加载

- (BOOL)isRootController;                       //判断是否为根Controller
- (BOOL)isCurrentController;                    //判断是否为当前Controller

@end
