//
//  DKTabBarViewController.m
//  DKObjectC
//
//  Created by 邓凯 on 2020/12/4.
//  Copyright © 2020 邓凯. All rights reserved.
//

#import "DKMainTabBarViewController.h"
#import "ZZFlexTestUIVC.h"
#import "ZZFlexTestListVC.h"
#import "DKMainViewController.h"

@interface DKMainTabBarViewController ()

@end

@implementation DKMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIViewController *vc;
    vc = [ZZFlexTestListVC new];
    vc.tabBarItem.title = @"首页";
    vc.tabBarItem.image = [UIImage imageNamed:@"p20"];
    [self addChildViewController:vc];
    
    vc = [DKMainViewController new];
    vc.tabBarItem.title = @"测试";
    vc.tabBarItem.image = [UIImage imageNamed:@"p20"];
    [self addChildViewController:vc];
    
    vc = [ZZFlexTestUIVC new];
    vc.tabBarItem.title = @"我的";
    vc.tabBarItem.image = [UIImage imageNamed:@"p20"];
    [self addChildViewController:vc];
    
//    vc = [ZZFlexTestVC new];
//    vc.tabBarItem.title = @"首页3";
//    vc.tabBarItem.image = [UIImage imageNamed:@"p20"];
//    [self addChildViewController:vc];
//
//    vc = [ZZFlexTestVC new];
//    vc.tabBarItem.title = @"首页4";
//    vc.tabBarItem.image = [UIImage imageNamed:@"p20"];
//    [self addChildViewController:vc];
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
