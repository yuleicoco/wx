
//
//  DoLogViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/19.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "DoLogViewController.h"
#import "DateView.h"

@interface DoLogViewController ()

@end

@implementation DoLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
      [self setNavTitle:NSLocalizedString(@"home_tab_log", nil)];
      [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"home_nav_add", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
   
    
    
    
}


- (void)SetupView
{
    
    UIButton * bu =[[UIButton alloc]initWithFrame:CGRectMake(0, 50, 300, 300)];
    
    bu.backgroundColor =[UIColor redColor];
    [bu setTitle:@"asfaf" forState:UIControlStateNormal];
    
    [self.view addSubview:bu];
    
}

// 添加

- (void)doRightButtonTouch
{
    
    FuckLog(@"添加点击");
    
    // 测试
    [self LoadDateView];
    
    
}


// 加载时间控件
- (void)LoadDateView
{
    
    DateView * daVW =[[DateView alloc]init];
    [self.view addSubview:daVW];
    
    [daVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
