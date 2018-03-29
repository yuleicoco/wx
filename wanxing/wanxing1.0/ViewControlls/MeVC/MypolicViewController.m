//
//  MypolicViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/28.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "MypolicViewController.h"
#import "jobTabCell.h"
#import "DateView.h"
#import "ChooseView.h"
#import "PoInfoViewController.h"
static NSString * cellId = @"meetTabid";

@interface MypolicViewController ()<DateviewDelegate,ChooseViewDelegate>
{
      DateView * daVW;
      ChooseView * chooseVW;
}

@end

@implementation MypolicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"me_vc_mypolic", nil)];
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
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineFor.mas_bottom).offset(0);
        make.bottom.equalTo(self.view).offset(-140);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    [self.tableView registerClass:[jobTabCell class] forCellReuseIdentifier:cellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

- (void)SpBtn:(UIButton *)sender
{
    
    chooseVW =[[ChooseView alloc]init];
    chooseVW.delegate = self;
    [self.view addSubview:chooseVW];
    
    [chooseVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
}

#pragma MARK---------------------choose协议

- (void)SureC
{
    
    [chooseVW removeFromSuperview];
}
- (void)CanceC
{
    
    [chooseVW removeFromSuperview];
}


// 选择日期

- (void)Date_btn:(UIButton *)sender
{
    NSInteger tag  = sender.tag -6666;
    
    
    
}


// 加载时间控件
- (void)LoadDateView
{
    
    daVW =[[DateView alloc]init];
    daVW.delegate = self;
    [self.view addSubview:daVW];
    
    [daVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
}

#pragma MARK---------------------Date协议

- (void)SureB
{
    [daVW removeFromSuperview];
    
}
- (void)CanceB
{
    [daVW removeFromSuperview];
    
    
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
    return 90;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    jobTabCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.contentView.userInteractionEnabled = YES;
    cell.LogName.text =@"重庆川仪项目";
    cell.LogDate.text =@"2018-2-13";
    cell.LogPerson.text =@"距离到期时间：3天";
    cell.LogIntro.text =@"现场文明试岗爱爱后方好好好哦啊好哦啊后你把护发偶吼吼啊哈哈佛号";
    cell.isOver.text =@"正在执行";
    //    [cell.btn  addTarget:self action:@selector(houxua:) forControlEvents:UIControlEventTouchUpInside];
    cell.btn.hidden = YES;
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    jobTabCell *cell = [tableView cellForRowAtIndexPath:indexPath];
   
    PoInfoViewController * vc =[[PoInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"222");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
