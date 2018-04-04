//
//  AllViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "AllViewController.h"
#import "DoTableViewCell.h"
#import "BuyExViewController.h"
#import "PackPayViewController.h"

static NSString * cellId = @"allTabid";
@interface AllViewController ()
@property(nonatomic,strong)NSMutableArray * imgaeArr;
@property(nonatomic,strong)NSMutableArray * nameArr;


// five
@property (nonatomic,strong)BuyExViewController * VC1;
@property (nonatomic,strong)PackPayViewController * VC2;



@end

@implementation AllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"all_vc_tit", nil)];
    self.view.backgroundColor = Gray_color_uibrother;
}


- (void)SetupView
{
    
    [super SetupView];

    self.imgaeArr =[[NSMutableArray alloc]initWithObjects:@"all_excel",@"all_pay",@"all_til",@"all_value",@"all_use",nil];
        self.nameArr =[[NSMutableArray alloc]initWithObjects:@"采购报表",@"分包支付",@"材料用量",@"产值申报",@"设备租赁", nil];
    
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-337);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    [self.tableView registerClass:[DoTableViewCell class] forCellReuseIdentifier:cellId];
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


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
    
    NSInteger inde = indexPath.row;
    
    switch (inde) {
        case 0:
            //采购报表
            [self.navigationController pushViewController:self.VC1 animated:YES];
            break;
        case 1:
            // 分包支付
            [self.navigationController pushViewController:self.VC2 animated:YES];
            break;
        case 2:
            // 材料用量
            
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Get and Set
- (BuyExViewController *)VC1{
    if (_VC1 == nil) {
        _VC1 = [[BuyExViewController alloc] init];
    }
    return _VC1;
}

- (PackPayViewController *)VC2{
    if (_VC2 == nil) {
        _VC2 = [[PackPayViewController alloc] init];
    }
    return _VC2;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
