//
//  ViewController.m
//  FirstGitProject
//
//  Created by JayLee on 16/1/15.
//  Copyright © 2016年 JayLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, retain) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.button setBackgroundImage:[[UIImage imageNamed:@"home_btn_order"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 23, 11, 24) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
