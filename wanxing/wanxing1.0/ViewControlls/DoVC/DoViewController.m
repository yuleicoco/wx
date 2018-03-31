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
@property(nonatomic,strong)DoLogViewController * vc ;
@property(nonatomic,strong)SafeViewController * vc1 ;
@property(nonatomic,strong)ControlViewController * vc2 ;
@property(nonatomic,strong)HouseViewController * vc3;
@property(nonatomic,strong)ProViewController * vc4;
@property(nonatomic,strong)AllViewController * vc5;
@property(nonatomic,strong)SingleViewController * vc6;
@property(nonatomic,strong)TaiViewController * vc7;


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
    self.imgaeArr =[[NSMutableArray alloc]initWithObjects:@"do_cell_bar",@"do_cell_info",@"do_cell_pro",@"do_cell_excel",@"do_cell_po",nil];
    self.nameArr =[[NSMutableArray alloc]initWithObjects:@"施工日志",@"库存信息",@"项目进度",@"报表统计",@"单据管理", nil];
    

    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-337);
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
    
    //
    //    DoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            // 施工日志
            [self.navigationController pushViewController:self.vc animated:YES];
            break;
        case 1:
            // 库存
            
            [self.navigationController pushViewController:self.vc3 animated:YES];
            
            break;
        case 2:
             [self.navigationController pushViewController:self.vc4 animated:YES];
            // 项目进度
            break;
            
        case 3:
            //报表
            [self.navigationController pushViewController:self.vc5 animated:YES];
            
            break;
        case 4:
            //单据
             [self.navigationController pushViewController:self.vc6 animated:YES];
            break;
            
        case 5:
           [self.navigationController pushViewController:self.vc7 animated:YES];
            //报表统计
            break;
        case 6:
            // 单据管理
            
            [self.navigationController pushViewController:self.vc6 animated:YES];
            break;
        case 7:
            // 台账管理
            
            [self.navigationController pushViewController:self.vc7 animated:YES];
            break;
            
            
        default:
            break;
    }
    
    
    NSLog(@"222");
}

#pragma mark - Get and Set
- (NSMutableArray *)imgaeArr{
    if (_imgaeArr == nil) {
        _imgaeArr = [[NSMutableArray alloc] init];
    }
    return _imgaeArr;
}

- (NSMutableArray *)nameArr{
    if (_nameArr == nil) {
        _nameArr = [[NSMutableArray alloc] init];
    }
    return _nameArr;
}

- (DoLogViewController *)vc{
    if (_vc == nil) {
        _vc = [[DoLogViewController alloc] init];
    }
    return _vc;
}

- (SafeViewController *)vc1{
    if (_vc1 == nil) {
        _vc1 = [[SafeViewController alloc] init];
    }
    return _vc1;
}

- (ControlViewController *)vc2{
    if (_vc2 == nil) {
        _vc2 = [[ControlViewController alloc] init];
    }
    return _vc2;
}

- (HouseViewController *)vc3{
    if (_vc3 == nil) {
        _vc3 = [[HouseViewController alloc] init];
    }
    return _vc3;
}

- (ProViewController *)vc4{
    if (_vc4 == nil) {
        _vc4 = [[ProViewController alloc] init];
    }
    return _vc4;
}

- (AllViewController *)vc5{
    if (_vc5 == nil) {
        _vc5 = [[AllViewController alloc] init];
    }
    return _vc5;
}

- (SingleViewController *)vc6{
    if (_vc6 == nil) {
        _vc6 = [[SingleViewController alloc] init];
    }
    return _vc6;
}

- (TaiViewController *)vc7{
    if (_vc7 == nil) {
        _vc7 = [[TaiViewController alloc] init];
    }
    return _vc7;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
