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



//***********************************************************************审核
#import "TendViewController.h" //雅安监狱小结
#import "PayViewViewController.h" //分包支付
#import "PlanViewController.h"  // 材料计划
#import "EndtendViewController.h" // 投标终止
#import "ContractViewController.h" // 弱电合同
#import "ChangeViewController.h" //监狱签证变更
#import "ChangeProViewController.h" // 监狱工程变更
#import "ValueViewController.h" // 产值申报
#import "SeparateConViewController.h" //分包合同
#import "ChangeSepViewController.h" // 分包合同变更
#import "ShenPlanViewController.h"  // 申购计划单




//***********************************************************************审核


static NSString * cellId = @"centercellTabid";
@interface CenterViewController ()

{
    
    ShowAlertView * vc;
}
@property (nonatomic,strong)TendViewController * Te;
@property (nonatomic,strong)PayViewViewController * Pay;
@property (nonatomic,strong)PlanViewController * Pl;
@property (nonatomic,strong)EndtendViewController * En;
@property (nonatomic,strong)ContractViewController * Con;
@property (nonatomic,strong)ChangeViewController * Ch;
@property (nonatomic,strong)ChangeProViewController * Chp;
@property (nonatomic,strong)ValueViewController * Va;
@property (nonatomic,strong)SeparateConViewController * Se;
@property (nonatomic,strong)ChangeSepViewController * Chse;
@property (nonatomic,strong)ShenPlanViewController * ShenV;

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
    return 11;
    
    
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
    
    
    switch (indexPath.row) {
        case 0:
            
            [self.navigationController pushViewController:self.Te animated:YES];
            break;
        case 1:
             [self.navigationController pushViewController:self.Pay animated:YES];
            break;
        case 2:
             [self.navigationController pushViewController:self.Pl animated:YES];
            break;
        case 3:
             [self.navigationController pushViewController:self.En animated:YES];
            break;
        case 4:
             [self.navigationController pushViewController:self.Con animated:YES];
            break;
        case 5:
             [self.navigationController pushViewController:self.Ch animated:YES];
            break;
        case 6:
             [self.navigationController pushViewController:self.Chp animated:YES];
            break;
        case 7:
             [self.navigationController pushViewController:self.Va animated:YES];
            break;
        case 8:
             [self.navigationController pushViewController:self.Se animated:YES];
            break;
        case 9:
             [self.navigationController pushViewController:self.Chse animated:YES];
            break;
            
        case 10:
            [self.navigationController pushViewController:self.ShenV animated:YES];
            break;
            
            
        default:
            break;
    }
    
    
}




#pragma mark - Get and Set
- (ShenPlanViewController *)ShenV{
    if (_ShenV == nil) {
        _ShenV = [[ShenPlanViewController alloc] init];
    }
    return _ShenV;
}

- (TendViewController *)Te{
    if (_Te == nil) {
        _Te = [[TendViewController alloc] init];
    }
    return _Te;
}

- (PayViewViewController *)Pay{
    if (_Pay == nil) {
        _Pay = [[PayViewViewController alloc] init];
    }
    return _Pay;
}

- (PlanViewController *)Pl{
    if (_Pl == nil) {
        _Pl = [[PlanViewController alloc] init];
    }
    return _Pl;
}

- (EndtendViewController *)En{
    if (_En == nil) {
        _En = [[EndtendViewController alloc] init];
    }
    return _En;
}

- (ContractViewController *)Con{
    if (_Con == nil) {
        _Con = [[ContractViewController alloc] init];
    }
    return _Con;
}

- (ChangeViewController *)Ch{
    if (_Ch == nil) {
        _Ch = [[ChangeViewController alloc] init];
    }
    return _Ch;
}

- (ChangeProViewController *)Chp{
    if (_Chp == nil) {
        _Chp = [[ChangeProViewController alloc] init];
    }
    return _Chp;
}

- (ValueViewController *)Va{
    if (_Va == nil) {
        _Va = [[ValueViewController alloc] init];
    }
    return _Va;
}

- (SeparateConViewController *)Se{
    if (_Se == nil) {
        _Se = [[SeparateConViewController alloc] init];
    }
    return _Se;
}

- (ChangeSepViewController *)Chse{
    if (_Chse == nil) {
        _Chse = [[ChangeSepViewController alloc] init];
    }
    return _Chse;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
