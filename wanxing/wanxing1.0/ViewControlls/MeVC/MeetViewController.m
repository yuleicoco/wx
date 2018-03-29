//
//  MeetViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/28.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "MeetViewController.h"

@interface MeetViewController ()

@end

@implementation MeetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    
    //设置下一级视图控制器导航返回按钮
    UIButton *btnMess = [UIButton new];
    btnMess.frame = CGRectMake(0, 0, 110, 30);
    btnMess.titleLabel.font = Ping_B(19);
    [btnMess setTitle:@"会议记录" forState:UIControlStateNormal];
    btnMess.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
    btnMess.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [btnMess addTarget:self action:@selector(backbtn:) forControlEvents:UIControlEventTouchUpInside];
    [btnMess setImage:[UIImage imageNamed:@"home_back"] forState:UIControlStateNormal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:btnMess];
    self.navigationItem.leftBarButtonItem = back;
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn addTarget:self action:@selector(searchbt:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setImage:[UIImage imageNamed:@"job_search"] forState:UIControlStateNormal];
    [searchBtn sizeToFit];
    UIBarButtonItem *searchBtnItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    
    UIBarButtonItem *fixedSpaceBarButtonItemONE = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceBarButtonItemONE.width = 20;
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"job_add"] forState:UIControlStateNormal];
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    
    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceBarButtonItem.width = 20;
    
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn addTarget:self action:@selector(file:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"meet_vc_fil"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems  = @[searchBtnItem,fixedSpaceBarButtonItemONE,settingBtnItem,fixedSpaceBarButtonItem,informationCardItem];
    
    [self setupmeetview];
    
}

- (void)setupmeetview
{
    
    UILabel * DateLB =[UILabel new];
    DateLB.text =@"日期";
    DateLB.font =Ping_R(16);
    [self.view addSubview:DateLB];
    [DateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(25);
        make.left.equalTo(self.view).offset(14);
        make.size.mas_equalTo(CGSizeMake(34, 15));
        
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
        make.top.equalTo(@14);
        make.height.equalTo(@38);
        
    }];
    
    UILabel * lineTh =[UILabel new];
    lineTh.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineTh];
    [lineTh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view)
        .offset(31);
        make.left.equalTo(DateLB.mas_right).offset(158);
        make.size.mas_equalTo(CGSizeMake(9, 2));
        
    }];
    
    
    UILabel * lineFor =[UILabel new];
    lineFor.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineFor];
    [lineFor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(66);
        make.height.equalTo(@5);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    
}

#pragma mark -- nav **************************************************************

- (void)backbtn:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


//  搜索
- (void)searchbt:(UIButton *)sender
{


}

- (void)file:(UIButton *)dender
{
    
    
}

- (void)addBtn:(UIButton *)sender
{
    
    
}


#pragma mark -- nav **************************************************************



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
