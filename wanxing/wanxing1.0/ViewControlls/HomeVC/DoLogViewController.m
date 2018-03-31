
//
//  DoLogViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/19.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "DoLogViewController.h"
#import "DateView.h"
#import "TableViewCell.h"
#import "ChooseView.h"
#import "DologModel.h"
#import "DologInforModel.h"
#import "AFHttpClient+DoLogClient.h"


static NSString * cellId = @"LogTabid";
@interface DoLogViewController ()<DateviewDelegate,ChooseViewDelegate>

@property (nonatomic,strong)DateView * daVW;
@property (nonatomic,strong)ChooseView * chooseVW;



@end

@implementation DoLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
      [self setNavTitle:NSLocalizedString(@"home_tab_log", nil)];
      [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"home_nav_add", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
    
    
}




- (void)SetupView
{
    [super SetupView];
    // 蓝色
    UILabel * lineOne =[UILabel new];
    lineOne.backgroundColor = Blue_color;
    [self.view addSubview:lineOne];
    [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view).offset(8);
        make.size.mas_equalTo(CGSizeMake(4, 16));
    }];
    // 项目名字
    UILabel * LogName =[UILabel new];
    LogName.font = Ping_R(16);
    LogName.textColor = Gray_color;
    LogName.text =@"重庆川仪项目";
    [self.view addSubview:LogName];
    
    [LogName mas_makeConstraints:^(MASConstraintMaker *make) {
        
         make.top.equalTo(self.view).offset(16);
         make.left.equalTo(lineOne.mas_right).offset(7);
        make.height.equalTo(@16);
    }];
    //
    UIButton * spBtn =[UIButton new];
    [spBtn setImage:[UIImage imageNamed:@"do_log_choo"] forState:UIControlStateNormal];
    [spBtn addTarget:self action:@selector(SpBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:spBtn];
    
    [spBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view.mas_right).offset(-14);
        make.size.mas_equalTo(CGSizeMake(10, 16));
        
    }];

    UILabel * lineTwo =[UILabel new];
    lineTwo.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineTwo];
    [lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(48);
        make.height.equalTo(@1);
        make.left.right.equalTo(self.view).offset(0);
        
        
    }];
    //
    
    UILabel * DateLB =[UILabel new];
    DateLB.text =@"日期";
    DateLB.font =Ping_R(16);
    [self.view addSubview:DateLB];
    [DateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(74);
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
        make.top.equalTo(@63);
        make.height.equalTo(@38);
        
    }];
    
    UILabel * lineTh =[UILabel new];
    lineTh.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineTh];
    [lineTh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineTwo.mas_bottom).offset(31);
        make.left.equalTo(DateLB.mas_right).offset(158);
        make.size.mas_equalTo(CGSizeMake(9, 2));
        
    }];
    
    
    UILabel * lineFor =[UILabel new];
    lineFor.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineFor];
    [lineFor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(115);
        make.height.equalTo(@5);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    //    tab
  

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineFor.mas_bottom).offset(0);
        make.bottom.equalTo(self.view).offset(-140);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellId];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    
    [self RequsetAFProjectList];
    
    
}

// 日志列表
- (void)RequsetAFlogList
{
    [[AFHttpClient sharedAFHttpClient]queryDoLogList:Best_string sel_Keyword:Best_null stime:@"2016-02-06" etime:Best_null checktime:Best_null page:Best_null rows:Best_null complete:^(BaseModel *model) {
        DologModel * loginModel = [[DologModel alloc]initWithDictionary:model.ResultData error:nil];
        loginModel.rows =[DologInforModel arrayOfModelsFromDictionaries:loginModel.rows];
        
        
    }];
    
}
// 项目列表

- (void)RequsetAFProjectList
{
    [[AFHttpClient sharedAFHttpClient]queryDoProList:@"eyJpZCI6ImNoZW5kYW4iLCJwd2QiOiIxMjM0NTYiLCJlcXVpcF90eXBlIjoiYW5kcm9pZCIsInZlcnNpb24iOiIxLjAuMC4wIiwibWV0aG9kIjoiUFJPSkVDVF9HZXRQcm9qZWN0In0=" sel_Keyword:Best_null bt:@"0" page:Best_null rows:Best_null complete:^(BaseModel *model) {
        
        FuckLog(@"22");
        
    }];
    
    
   
}


// 选择项目

- (void)SpBtn:(UIButton *)sender
{
    
    _chooseVW =[[ChooseView alloc]init];
    _chooseVW.delegate = self;
    [self.view addSubview:_chooseVW];
    
    [_chooseVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
}

#pragma MARK---------------------choose协议

- (void)SureC
{
    
    [_chooseVW removeFromSuperview];
}
- (void)CanceC
{
    
    [_chooseVW removeFromSuperview];
}


// 选择日期

- (void)Date_btn:(UIButton *)sender
{
    NSInteger tag  = sender.tag -6666;
    
    
    
}


// 添加

- (void)doRightButtonTouch
{
    
    // 测试
    [self LoadDateView];
    
    
}


// 加载时间控件
- (void)LoadDateView
{
    
    _daVW =[[DateView alloc]init];
    _daVW.delegate = self;
    [self.view addSubview:_daVW];
    
    [_daVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
}

#pragma MARK---------------------Date协议

- (void)SureB
{
    [_daVW removeFromSuperview];
    
}
- (void)CanceB
{
     [_daVW removeFromSuperview];
    
    
}

#pragma MARK---------------------TAB协议

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
    return 68;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.LogName.text =@"重庆川仪项目";
    cell.LogDate.text =@"2018-2-13";
    cell.LogPerson.text =@"负责人:余磊";
    cell.LogIntro.text =@"现场文明试岗爱爱后方好好好哦啊好哦啊后你把护发偶吼吼啊哈哈佛号";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  //
    TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    LgoInforViewController * logVC =[[LgoInforViewController alloc]init];
    [self.navigationController pushViewController:logVC animated:YES];
    
     NSLog(@"222");
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
