//
//  SingleViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "SingleViewController.h"
#import "DoTableViewCell.h"
#import "DaViewController.h"



static NSString * cellId = @"singTabid";

@interface SingleViewController ()
@property(nonatomic,strong)NSMutableArray * imgaeArr;
@property(nonatomic,strong)NSMutableArray * nameArr;
@property (nonatomic,strong)DaViewController * DayView;


@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavTitle:NSLocalizedString(@"single_vc_title", nil)];
    self.view.backgroundColor = Gray_color_uibrother;
}

- (void)SetupData
{
    [super SetupData];
    self.imgaeArr =[[NSMutableArray alloc]initWithObjects:@"single_da",@"single_li",@"single_he",nil];
    self.nameArr =[[NSMutableArray alloc]initWithObjects:@"日常报销",@"付款申请单",@"合同收入", nil];
    
}
- (void)SetupView
{
    [super SetupView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view.mas_top).offset(135);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    [self.tableView registerClass:[DoTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.estimatedRowHeight = 53;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
}

#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 3;
    
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
    //    DoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    

    
    switch (indexPath.row) {
        case 0:
            // 日常费用
            [self.navigationController pushViewController:self.DayView animated:YES];
            break;
        case 1:
            // 库存
            
            
            
            break;
        case 2:
           
            // 项目进度
            break;
  
            
        default:
            break;
    }
    
    
    NSLog(@"222");
}

#pragma mark - Get and Set

- (DaViewController *)DayView{
    if (_DayView == nil) {
        _DayView = [[DaViewController alloc] init];
    }
    return _DayView;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
