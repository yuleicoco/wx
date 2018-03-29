
//
//  InforViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/24.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "InforViewController.h"

@interface InforViewController ()

@end

@implementation InforViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNavTitle:NSLocalizedString(@"me_vc_message", nil)];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"me_vc_des", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}


- (void)SetupView

{
    [super SetupView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
