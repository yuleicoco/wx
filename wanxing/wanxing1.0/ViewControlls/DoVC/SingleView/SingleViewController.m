//
//  SingleViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "SingleViewController.h"

@interface SingleViewController ()

@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavTitle:NSLocalizedString(@"single_vc_title", nil)];
    self.view.backgroundColor = Gray_color_uibrother;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
