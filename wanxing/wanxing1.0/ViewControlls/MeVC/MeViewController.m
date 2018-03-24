//
//  MeViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "MeViewController.h"
#import "InforViewController.h"
#import "DoTableViewCell.h"
#import "JobViewController.h"

static NSString * cellId = @"meTabid";

@interface MeViewController ()
@property(nonatomic,strong)NSMutableArray * imgaeArr;
@property(nonatomic,strong)NSMutableArray * nameArr;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(230, 230, 230);
    [self hideNav];
    
}


- (void)SetupView
{
    
    [super SetupView];
    
    UIImageView * bgima =[UIImageView new];
    bgima.image =[UIImage imageNamed:@"me_bg"];
    [self.view addSubview:bgima];
    [bgima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(self.view).offset(0);
        make.height.equalTo(@194);
        
    }];
    
    
    UIButton *btnMess = [UIButton new];
    [btnMess setTitle:@"系统信息" forState:UIControlStateNormal];
    [btnMess setImage:[UIImage imageNamed:@"me_message"] forState:UIControlStateNormal];
    btnMess.adjustsImageWhenHighlighted = NO;
    btnMess.titleLabel.font =Ping_R(13);
    btnMess.imageEdgeInsets = UIEdgeInsetsMake(0, -6, 0, 11);
    btnMess.titleEdgeInsets = UIEdgeInsetsMake(0, -0, 0, 0);
    btnMess.backgroundColor = RGB(33, 187, 244);
    [btnMess addTarget:self action:@selector(message_btn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMess];
    
    [btnMess mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.top.equalTo(bgima.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(120, 51));
    }];
    
    
    UIButton *btnAcco = [UIButton new];
    [btnAcco setTitle:@"账号管理" forState:UIControlStateNormal];
    btnAcco.titleLabel.font =Ping_R(13);
    [btnAcco setImage:[UIImage imageNamed:@"me_account"] forState:UIControlStateNormal];
    btnAcco.adjustsImageWhenHighlighted = NO;
    btnAcco.backgroundColor = RGB(9, 177, 219);
    btnAcco.imageEdgeInsets = UIEdgeInsetsMake(0, -110, 0, 17);
    btnAcco.titleEdgeInsets = UIEdgeInsetsMake(0, -110, 0, 0);
    [self.view addSubview:btnAcco];
    
    [btnAcco mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(bgima.mas_bottom).offset(0);
        make.left.equalTo(btnMess.mas_right).offset(0);
        make.height.equalTo(@51);
    }];
    
    
    
    UIImageView * heaimge =[UIImageView new];
    heaimge.layer.borderColor =RGB(9, 162, 219).CGColor;
    heaimge.layer.borderWidth = 4;
    heaimge.image =[UIImage imageNamed:@"tse.jpg"];
    heaimge.layer.masksToBounds = YES;
    heaimge.layer.cornerRadius = 106/2;
    [self.view addSubview:heaimge];
    [heaimge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-25);
        make.top.equalTo(self.view).offset(136);
        make.size.mas_equalTo(CGSizeMake(106, 106));
    }];
    
    
    self.imgaeArr =[[NSMutableArray alloc]initWithObjects:@"me_task", @"me_po",@"me_meet",@"me_clock",@"me_test",nil];
    self.nameArr =[[NSMutableArray alloc]initWithObjects:@"我的任务",@"我的预警",@"会议记录",@"考勤信息",@"审批信息", nil];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(245);
        make.bottom.equalTo(self.view).offset(-159);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    [self.tableView registerClass:[DoTableViewCell class] forCellReuseIdentifier:cellId];
    
    
    
    
    
    
}


#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return self.imgaeArr.count;
    
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
    
     JobViewController * VC =[[JobViewController alloc]init];
    
    NSInteger s = indexPath.row;
    switch (s) {
        case 0:
            [self.navigationController pushViewController:VC animated:YES];
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        default:
            break;
    }
    
   
    
}


- (void)message_btn:(UIButton *)sender
{
    
    InforViewController * vc =[[InforViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
