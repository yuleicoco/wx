//
//  ClockViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/22.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController ()

@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
     self.view.backgroundColor =[UIColor whiteColor];
    [self setNavTitle:NSLocalizedString(@"work_q_c", nil)];
     [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"work_nav", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}

-(void)SetupView
{
    [super SetupView];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
