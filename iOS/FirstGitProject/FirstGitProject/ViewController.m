//
//  ViewController.m
//  FirstGitProject
//
//  Created by JayLee on 16/1/15.
//  Copyright © 2016年 JayLee. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "TouchIDTestViewController.h"
#import "GCDTestViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {

}

@property(nonatomic, retain) NSArray *allListData;
@property(nonatomic, retain) IBOutlet UITableView *tvAllList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.allListData = @[@"测试黑科技", @"测试TouchID", @"CGD测试"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_allListData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = _allListData[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            TestViewController *controller = [TestViewController viewControllerFromNib];
            controller.title = _allListData[indexPath.row];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 1:
        {
            TouchIDTestViewController *controller = [TouchIDTestViewController viewControllerFromNib];
            controller.title = _allListData[indexPath.row];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 2:
        {
            GCDTestViewController *controller = [GCDTestViewController viewControllerFromNib];
            controller.title = _allListData[indexPath.row];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
