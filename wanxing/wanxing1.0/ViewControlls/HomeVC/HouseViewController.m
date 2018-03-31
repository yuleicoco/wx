//
//  HouseViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/19.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "HouseViewController.h"
#import "HouseInfoViewController.h"

static NSString * cellId = @"houseTabid";
@interface HouseViewController ()

@property(nonatomic,strong)NSMutableArray * imgaeArr;
@property(nonatomic,strong)NSMutableArray * nameArr;

@end

@implementation HouseViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    
     [self setNavTitle:NSLocalizedString(@"home_tab_housue", nil)];
}

- (void)SetupView
{
    [super SetupView];
    
    self.imgaeArr =[[NSMutableArray alloc]initWithObjects:@"house_vc_one", @"house_vc_two",@"house_vc_th",nil];
    self.nameArr =[[NSMutableArray alloc]initWithObjects:@"一号仓库",@"二号仓库",@"三号仓库",@"四号仓库",@"五号仓库", nil];
    
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-178);
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
    return 5;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 53;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DoTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.self.imageC.image = [UIImage imageNamed:self.imgaeArr[ arc4random() %self.imgaeArr.count]];
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
    
    HouseInfoViewController * vc =[[HouseInfoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    NSLog(@"222");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
