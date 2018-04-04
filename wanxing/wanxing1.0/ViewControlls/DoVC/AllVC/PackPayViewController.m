//
//  PackPayViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PackPayViewController.h"
#import "Charts/Charts.h"

@interface PackPayViewController ()

@end

@implementation PackPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"all_vc_two", nil)];
    
    BarChartView *chatView = [[BarChartView alloc] initWithFrame:CGRectMake(5, 5, [UIScreen mainScreen].bounds.size.width - 10, [UIScreen mainScreen].bounds.size.height - 10)];
    [self.view addSubview:chatView];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
