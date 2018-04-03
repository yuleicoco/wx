//
//  DaViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/31.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "DaViewController.h"
#import "jobTabCell.h"
#import "SearchSingleView.h"
#import "NewSingleViewController.h"
#import "Single_infoViewController.h"
#import "MycodeViewController.h"

static NSString * cellId = @"daTabid";
@interface DaViewController ()<UITableViewDelegate,UITableViewDataSource,SingelSearViewDelegate>
@property (nonatomic,strong)UITableView * tabJob;
@property (nonatomic,strong)SearchSingleView   * SearView;


@end

@implementation DaViewController
@synthesize SearView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置下一级视图控制器导航返回按钮
    UIButton *btnMess = [UIButton new];
    btnMess.frame = CGRectMake(0, 0, 110, 30);
    btnMess.titleLabel.font = Ping_B(19);
    [btnMess setTitle:@"日常费用" forState:UIControlStateNormal];
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
    [settingBtn addTarget:self action:@selector(infomessage:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"job_text"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems  = @[searchBtnItem,fixedSpaceBarButtonItemONE,settingBtnItem,fixedSpaceBarButtonItem,informationCardItem];
    
    [self setupjovview];
}

- (void)setupjovview
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
    [self.tabJob registerClass:[jobTabCell class] forCellReuseIdentifier:cellId];
    [self.tabJob reloadData];
    [self.tabJob mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineFor.mas_bottom).offset(0);
        make.left.and.right.and.bottom.equalTo(self.view).offset(0);
    }];
    
    
    
}

// 选择日期

- (void)Date_btn:(UIButton *)sender
{
    NSInteger tag  = sender.tag -6666;
    
    
    
}




//  搜索
- (void)searchbt:(UIButton *)sender
{
    
    SearView =[[SearchSingleView alloc]init];
    SearView.delegate = self;
    [self.view addSubview:SearView];
    
    
    [SearView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
    
}

- (void)SeacrchVC
{
    
    [SearView removeFromSuperview];
    
    
}


// 文本
- (void)infomessage:(UIButton *)sender
{
    MycodeViewController * vc =[[MycodeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

// add

- (void)addBtn:(UIButton *)sender
{

    NewSingleViewController * vc =[[NewSingleViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (void)backbtn:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
    return 90;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    jobTabCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[jobTabCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    cell.contentView.userInteractionEnabled = YES;
    cell.LogName.text =@"重庆川仪项目";
    cell.LogDate.text =@"2018-2-13";
    cell.LogPerson.text =@"创建人:余磊 |计划结束:2-28 8:40";
    cell.LogIntro.text =@"现场文明试岗爱爱后方好好好哦啊好哦啊后你把护发偶吼吼啊哈哈佛号";
    cell.isOver.text =@"正在执行";
    //    [cell.btn  addTarget:self action:@selector(houxua:) forControlEvents:UIControlEventTouchUpInside];
    cell.btn.hidden = YES;
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}

- (void)houxua:(UIButton *)sender
{
    sender.selected = !sender.selected;
    FuckLog(@"1");
    
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //   FuckLog(@"3");
    
    Single_infoViewController * vc =[[Single_infoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

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
