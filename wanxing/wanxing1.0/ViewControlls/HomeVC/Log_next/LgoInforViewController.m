//
//  LgoInforViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/22.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "LgoInforViewController.h"

@interface LgoInforViewController ()

@end

@implementation LgoInforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavTitle:@"xxx项目"];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"home_log_write", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}

- (void)SetupView
{
   
    UILabel * lb=[UILabel new];
    lb.text = NSLocalizedString(@"home_log_Text", nil);
    lb.font = Ping_R(16);
    [self.view addSubview:lb];
    
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(14);
        make.size.mas_equalTo(CGSizeMake(68, 15));
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
