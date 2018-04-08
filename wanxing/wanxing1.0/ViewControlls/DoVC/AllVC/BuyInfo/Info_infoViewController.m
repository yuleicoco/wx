//
//  Info_infoViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/8.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "Info_infoViewController.h"
#import "TwoLBTableViewCell.h"

static NSString * cellId = @"buyinfo_infoTabid";
@interface Info_infoViewController ()
@property(nonatomic,strong)NSMutableArray * arrlb;


@end

@implementation Info_infoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
      [self setNavTitle:@"xxxx项目"];
}

- (void)SetupData
{
    [super SetupData];

    self.arrlb =[NSMutableArray arrayWithObjects:@"材料编号",@"数量",@"总金额",@"规格",@"入库时间", nil];
    
    
}

- (void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self.view).offset(0);
    }];
    
    [self.tableView registerClass:[TwoLBTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TwoLBTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.lb.text = self.arrlb[indexPath.row];
    cell.datlb.text = @"卡扣";
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
