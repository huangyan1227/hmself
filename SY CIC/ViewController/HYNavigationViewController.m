//
//  HYNavigationViewController.m
//  SY CIC
//
//  Created by bidiao on 16/2/16.
//  Copyright © 2016年 hybidiao. All rights reserved.
//

#import "HYNavigationViewController.h"

@interface HYNavigationViewController ()

@end

@implementation HYNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"natabar"] forBarMetrics:UIBarMetricsDefault];
   // self.navigationController.navigationBar.translucent =NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
