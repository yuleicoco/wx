//
//  SafeViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "SafeViewController.h"

@interface SafeViewController ()

@end

@implementation SafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:NSLocalizedString(@"safe_vc_titl", nil)];
    self.view.backgroundColor = Gray_color_uibrother;
}


- (void)SetupView
{
    [super SetupView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
