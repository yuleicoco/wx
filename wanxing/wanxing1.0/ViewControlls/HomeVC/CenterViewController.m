//
//  CenterViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/19.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "CenterViewController.h"
#import "ShowAlertView.h"
#import "CenterTableViewCell.h"
#import "PayViewViewController.h"
#import "TendViewController.h"

static NSString * cellId = @"centercellTabid";
@interface CenterViewController ()

{
    
    ShowAlertView * vc;
    
    
}
@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"home_tab_center", nil)];
   
}

- (void)SetupView
{
    [super SetupView];
    
    [self.tableView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.equalTo(self.view).offset(0);
    }];
    [self.tableView registerClass:[CenterTableViewCell class] forCellReuseIdentifier:cellId];

    
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.LogName.text =@"重庆川仪项目";
    cell.LogDate.text =@"2018-2-13";
    cell.LogIntro.text =@"单据编号：6629ahgufaho";
    cell.isOver.text =@"等待审核";
    cell.isperson.text =@"申请人：是你";
    
    return cell;
}

// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PayViewViewController * vc =[[PayViewViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
