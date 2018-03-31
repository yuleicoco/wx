//
//  HouseInfoViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "HouseInfoViewController.h"
#import "HouseTableViewCell.h"
#import "CaiViewController.h"

static NSString * cellId = @"housecellTabid";
@interface HouseInfoViewController ()
{
    
    BOOL isFirst;
    
}

@end

@implementation HouseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"一号仓库"];
    [self showBarButton:NAV_RIGHT imageName:@"house_saech"];
    isFirst = NO;
    
    
  
    
}


- (void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.equalTo(self.view).offset(0);
    }];
    [self.tableView registerClass:[HouseTableViewCell class] forCellReuseIdentifier:cellId];
    
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     self.tableView.backgroundColor = [UIColor colorWithWhite:215 / 255.0 alpha:1];
    
    
}

#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 5;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    HouseTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.LogName.text =@"镀锌线脚线";
    cell.numID.text =@"编号:D_571231241244 | 规格:zrasffafafa";
    cell.numlb.text =@"数量:3000";
    cell.LogPerson.text = @"单位:米";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = view_bg;
    
    return cell;
    
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    //    DoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    CaiViewController * vc =[[CaiViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    NSLog(@"222");
}

- (void)doRightButtonTouch
{
    NSLog(@"搜索");
    if (isFirst ==NO) {
      [self showBarButton:NAV_RIGHT title:@"取消" fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
        
        UISearchBar * bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 250, 40)];
        bar.placeholder =@"请输入材料名称";
        UIImage *searchIcon = [UIImage imageNamed:@"house_cl"];
        [bar setImage:searchIcon forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        self.navigationItem.titleView=bar;
        isFirst =YES;
    }else
    {
        self.navigationItem.titleView = nil;
        [self setNavTitle:@"一号仓库"];
        [self showBarButton:NAV_RIGHT imageName:@"house_saech"];
    }
    
    
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
