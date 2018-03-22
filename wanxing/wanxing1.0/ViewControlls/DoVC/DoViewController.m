//
//  DoViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "DoViewController.h"
#import "DoTableViewCell.h"

static NSString * cellId = @"InfoTabid";
@interface DoViewController ()

@property(nonatomic,strong)NSMutableArray * imgaeArr;
@property(nonatomic,strong)NSMutableArray * nameArr;

@end

@implementation DoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setNavTitle:NSLocalizedString(@"do_title", nil)];
    self.view.backgroundColor = Gray_color_uibrother;
    
}


- (void)SetupData
{
    
    
    
    
}



 - (void)SetupView
{
    
    [super SetupView];
    
    NSLog(@"1111");
    self.imgaeArr =[[NSMutableArray alloc]initWithObjects:@"do_cell_bar", @"do_cell_sa",@"do_cell_control",@"do_cell_info",@"do_cell_pro",@"do_cell_excel",@"do_cell_po",@"do_cell_tai",nil];
    self.nameArr =[[NSMutableArray alloc]initWithObjects:@"施工日志",@"安全中心",@"质量管理",@"库存信息",@"项目进度",@"报表统计",@"单据管理",@"台账管理", nil];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-178);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    [self.tableView registerClass:[DoTableViewCell class] forCellReuseIdentifier:cellId];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 8;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 53;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DoTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.self.imageC.image = [UIImage imageNamed:self.imgaeArr[indexPath.row]];
    cell.self.lb.text = self.nameArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    DoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"222");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
