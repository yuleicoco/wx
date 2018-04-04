//
//  PlanAViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PlanAViewController.h"

static NSString * cellId = @"planaTabid";

@interface PlanAViewController ()
{
    NSMutableArray * arr;
}

@end

@implementation PlanAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)SetupData
{
    [super SetupData];
    
     arr =[NSMutableArray arrayWithObjects:@"项目名称",@"计划编号",@"计划人",@"机会时间",nil];
}

-(void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self.view).offset(0);
        
    }];
    [self.tableView registerClass:[CaiTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.tableFooterView =[[CaiHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return arr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CaiTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.lb.text = arr[indexPath.row];
    cell.dalb.text =@"哈哈我是";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(nonnull UIView *)view forSection:(NSInteger)section {
    if ([view isMemberOfClass:[CaiHeaderView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor clearColor];
    }
}


// 禁止下拉
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        CGFloat offY = scrollView.contentOffset.y;
        if (offY < 0) {
            scrollView.contentOffset = CGPointZero;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
