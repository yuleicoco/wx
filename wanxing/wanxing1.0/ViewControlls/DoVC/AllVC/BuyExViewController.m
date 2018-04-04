//
//  BuyExViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BuyExViewController.h"

@interface BuyExViewController ()

@end

@implementation BuyExViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setNavTitle:NSLocalizedString(@"all_vc_one", nil)];
}

- (void)SetupView
{
     [super SetupView];
    
    UILabel * DateLB =[UILabel new];
    DateLB.text =@"日期";
    DateLB.font =Ping_R(17);
    DateLB.textColor = Gray_color_128;
    [self.view addSubview:DateLB];
    [DateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view).offset(11);
        make.size.mas_equalTo(CGSizeMake(34, 16));
        
    }];
    
    NSMutableArray * arrBtn =[NSMutableArray new];
    for (NSInteger i = 0; i <2; i++) {
        UIButton * btn =[[UIButton alloc]init];
        btn.backgroundColor =[UIColor whiteColor];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        
        
        
        btn.tag = 6666+i;
        [btn setBackgroundImage:[UIImage imageNamed:@"do_log_box"] forState:UIControlStateNormal];
        [btn setTitle:@"2018-2-18" forState:UIControlStateNormal];
        [btn setTitleColor:Gray_color forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(Date_btn:) forControlEvents:UIControlEventTouchUpInside];
        [arrBtn addObject:btn];
        [self.view addSubview:btn];
    }
    
    [arrBtn mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:27 leadSpacing:53 tailSpacing:11];
    [arrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(8);
        make.height.equalTo(@34);
        
    }];
    
    UILabel * lineTh =[UILabel new];
    lineTh.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineTh];
    [lineTh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(23);
        make.left.equalTo(DateLB.mas_right).offset(158);
        make.size.mas_equalTo(CGSizeMake(9, 2));
        
    }];
    
    UILabel * lineFor =[UILabel new];
    lineFor.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineFor];
    [lineFor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(DateLB.mas_bottom).offset(18);
        make.height.equalTo(@5);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
