//
//  TouchIDTestViewController.m
//  FirstGitProject
//
//  Created by LiJun on 3/29/16.
//  Copyright © 2016 JayLee. All rights reserved.
//

#import "TouchIDTestViewController.h"
#import <LocalAuthentication/LAContext.h>
#import <LocalAuthentication/LAError.h>
#import <LocalAuthentication/LAPublicDefines.h>

@interface TouchIDTestViewController ()

@property(nonatomic, assign) IBOutlet UILabel *lbTestInfo;

@end

@implementation TouchIDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTestDidClick:(id)sender {
    LAContext *context = [LAContext new];
    NSError *error;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
        context.localizedFallbackTitle = @"返回";
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
            _lbTestInfo.text = @"Touch ID is available.";
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication
                    localizedReason:NSLocalizedString(@"使用Touch ID登录", nil)
                              reply:^(BOOL success, NSError *error) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      if (success) {
                                          _lbTestInfo.text = @"Authenticated using Touch ID.";
                                      } else {
                                          if (error.code == kLAErrorUserFallback) {
                                              _lbTestInfo.text = @"User tapped Enter Password";
                                          } else if (error.code == kLAErrorUserCancel) {
                                              _lbTestInfo.text = @"User tapped Cancel";
                                          } else {
                                              _lbTestInfo.text = @"Authenticated failed.";
                                          }
                                      }
                                  });
                              }];
        } else {
            _lbTestInfo.text = [NSString stringWithFormat:@"Touch ID is not available: %@", error];
        }
    } else {
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            _lbTestInfo.text = @"Touch ID is available.";
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                    localizedReason:NSLocalizedString(@"使用Touch ID登录", nil)
                              reply:^(BOOL success, NSError *error) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      if (success) {
                                          _lbTestInfo.text = @"Authenticated using Touch ID.";
                                      } else {
                                          if (error.code == kLAErrorUserFallback) {
                                              _lbTestInfo.text = @"User tapped Enter Password";
                                          } else if (error.code == kLAErrorUserCancel) {
                                              _lbTestInfo.text = @"User tapped Cancel";
                                          } else {
                                              _lbTestInfo.text = @"Authenticated failed.";
                                          }
                                      }
                                  });
                              }];
        } else {
            _lbTestInfo.text = [NSString stringWithFormat:@"Touch ID is not available: %@", error];
        }
    }
}

@end
