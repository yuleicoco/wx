//
//  ClockHistoryViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/23.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ClockHistoryViewController.h"
#import "ClockHeadView.h"
#import "ClockTableViewCell.h"
#import "Seachclockview.h"



static NSString * cellId = @"clockTabid";

@interface ClockHistoryViewController ()<SearchViewDelegate>

@end

@implementation ClockHistoryViewController
@synthesize SearView;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"work_clock_history", nil)];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"work_clock_ho", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}


- (void)SetupView
{
    [super SetupView];
    UIButton * btnY =[UIButton new];
    [btnY setImage:[UIImage imageNamed:@"work_left_clock"] forState:UIControlStateNormal];
    [self.view addSubview:btnY];
    [btnY mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(13);
        make.top.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(7.5, 12));
        
    }];
    UILabel * lby =[UILabel new];
    lby.font  = Ping_R(17);
    lby.text =@"2018";
    [self.view addSubview:lby];
    [lby mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnY.mas_right).offset(24);
        make.top.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(60, 15));
    }];
    
    
    UILabel * lbm =[UILabel new];
    lbm.font  = Ping_R(17);
    lbm.text =@"2月28日";
    [self.view addSubview:lbm];
    [lbm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lby.mas_right).offset(8);
        make.top.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(75, 15));
    }];
    
    UIButton * btnM =[UIButton new];
    [btnM setImage:[UIImage imageNamed:@"work_right_clock"] forState:UIControlStateNormal];
    [self.view addSubview:btnM];
    [btnM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lbm.mas_right).offset(13);
        make.top.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(7.5, 12));
        
    }];
    
    UIButton * btnList =[UIButton new];
    [btnList setTitle:@"排行榜" forState:UIControlStateNormal];
    btnList.titleLabel.font = Ping_R(17);
    [btnList setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btnList];
    [btnList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnM.mas_right).offset(43);
        make.top.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(52, 16.5));
    }];
    
    UIButton * searchbtn =[UIButton new];
    [searchbtn setImage:[UIImage imageNamed:@"work_search_clock"] forState:UIControlStateNormal];
    [searchbtn addTarget:self action:@selector(srarchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchbtn];
    [searchbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-21);
        make.size.mas_equalTo(CGSizeMake(17, 16.5));
        
        
    }];
    UILabel * lbline =[UILabel new];
    lbline.backgroundColor  = Gray_color_uibrother;
    [self.view addSubview:lbline];
    
    [lbline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(45);
        make.height.equalTo(@5);
    }];
    
   // *********tab
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50);
        make.right.and.left.and.bottom.equalTo(self.view).offset(0);

    }];
    
     [self.tableView registerClass:[ClockTableViewCell class] forCellReuseIdentifier:cellId];
      self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
}

#pragma MARK---------------------TAB协议

- (void)srarchBtn:(UIButton *)sender
{

    SearView =[[Seachclockview alloc]init];
    SearView.delegate = self;
    [self.view addSubview:SearView];
    
    [SearView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
}

- (void)Seacrch
{
    [SearView removeFromSuperview];
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
    return 47;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ClockTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.lbone.text =@"上官蕴奇";
    cell.lbtw.text =@"穿越部";
    cell.lbth.text =@"9：03";
    cell.lbfo.text =@"尚未打卡";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}



- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    static NSString *viewIdentfier = @"headView";
    ClockHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    if(!sectionHeadView){
        
        sectionHeadView = [[ClockHeadView alloc] initWithReuseIdentifier:viewIdentfier];
    }
    return sectionHeadView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 37;
    
}

// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    

    NSLog(@"222");
}



#pragma makr - btnmethod








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
