//
//  NewSingleViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/31.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "NewSingleViewController.h"

@interface NewSingleViewController ()

@end

@implementation NewSingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"新增报销"];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"single_finsh", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
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
