//
//  ChangeViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ChangeViewController.h"

/*****************************************监狱项目签证变更************************************* 6*/
@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"监狱签证项目变更"];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"single_shen", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
