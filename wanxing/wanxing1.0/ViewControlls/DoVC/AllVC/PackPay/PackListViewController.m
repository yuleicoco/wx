
//
//  PackListViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/8.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PackListViewController.h"
#import "PayListTableViewCell.h"
#import "SearchPay.h"
#import "ListPayViewController.h"



static NSString * cellId = @"paylistcell";
@interface PackListViewController ()<UITableViewDelegate,UITableViewDataSource,SearchPayDelegate>
@property (nonatomic,strong)UITableView * tabJob;
@property (nonatomic,strong)SearchPay * searchView;



@end

@implementation PackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    //设置下一级视图控制器导航返回按钮
    UIButton *btnMess = [UIButton new];
    btnMess.frame = CGRectMake(0, 0, 110, 30);
    btnMess.titleLabel.font = Ping_B(19);
    [btnMess setTitle:@"分包支付" forState:UIControlStateNormal];
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
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn addTarget:self action:@selector(infomessage:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"pay_list"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems  = @[searchBtnItem,fixedSpaceBarButtonItemONE,settingBtnItem];
    
    [self  seupview];
}

- (void)seupview
{
    
    // tab
    self.tabJob = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tabJob.backgroundColor = [UIColor whiteColor];
    self.tabJob.userInteractionEnabled = YES;
    self.tabJob.layer.borderWidth =0.5;
    self.tabJob.layer.borderColor = Gray_color_tt.CGColor;
    self.tabJob.separatorInset = UIEdgeInsetsZero;
    self.tabJob.layoutMargins = UIEdgeInsetsZero;
    self.tabJob.delegate =self;
    self.tabJob.dataSource = self;
    self.tabJob.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tabJob];
    [self.tabJob registerClass:[PayListTableViewCell class] forCellReuseIdentifier:cellId];
    [self.tabJob reloadData];
    [self.tabJob mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.and.top.equalTo(self.view).offset(0);
    }];
    
    
}


- (void)backbtn:(UIButton *)sender
{
      [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)infomessage:(UIButton *)sender
{
     [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)searchbt:(UIButton *)sender
{
   
    _searchView =[[SearchPay alloc]init];
    _searchView.delegate = self;
    [self.view addSubview:_searchView];
    [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.and.bottom.equalTo(self.view).offset(0);
    }];
    
    
}
- (void)SeacrchVC
{
    [_searchView removeFromSuperview];
    
}
#pragma MARK---------------------TAB协议^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 6;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PayListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[PayListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    cell.contentView.userInteractionEnabled = YES;
    cell.LogName.text =@"重庆川仪项目";
    cell.moneyLB.text =@"总金额:24u728u4024元";
    cell.LogIntro.text =@"分包商：哈殴打和IP发害怕害怕鸡皮肤哈皮 阿宝还频繁";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListPayViewController * VC =[[ListPayViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
