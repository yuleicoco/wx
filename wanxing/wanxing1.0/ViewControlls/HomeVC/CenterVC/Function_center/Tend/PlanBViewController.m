//
//  PlanBViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PlanBViewController.h"
#import "PlanBTableViewCell.h"
#import "PlanNextViewController.h"

static NSString * cellId = @"planBTabid";
@interface PlanBViewController ()

@end

@implementation PlanBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self.view).offset(0);
        
    }];
    [self.tableView registerClass:[PlanBTableViewCell class] forCellReuseIdentifier:cellId];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 4;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PlanBTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.introlb.text=@"波阿伯安次哦啊哦闹闹是那女脑啊发发";
    cell.numlb.text =@"233";
    cell.caiLB.text =@"你不好哈时候";
    cell.guilb.text =@"擦哈哈闹得很骄傲的哈大红椒";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlanNextViewController * vc =[[PlanNextViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 122;
}


@end
