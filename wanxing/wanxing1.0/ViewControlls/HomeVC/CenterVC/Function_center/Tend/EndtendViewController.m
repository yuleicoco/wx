
//
//  EndtendViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "EndtendViewController.h"
#import "EasyHeadView.h"
#import "TwoLBTableViewCell.h"
#import "TendBaseViewHeadView.h"



static NSString * cellId = @"endTabid";
static NSString * headid =@"endhead";
static NSString * footid =@"endfoot";
/*****************************************雅安监狱投标终止************************************* 4*/
@interface EndtendViewController ()
{
    
    NSMutableArray  * arrOne;
    NSMutableArray  * arrTwo;
    
}

@end

@implementation EndtendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"雅安监狱投标终止"];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"single_shen", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}


- (void)SetupData
{
    [super SetupData];
    
    arrOne =[NSMutableArray arrayWithObjects:@"项目",@"投标轮次", @"问题影响",@"发现时间",nil];
    arrTwo=[NSMutableArray arrayWithObjects:@"处理时间",@"处理人员",nil];
}

- (void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.equalTo(self.view).offset(0);
        make.height.equalTo(@1000);
       
        
    }];
    [self.tableView registerClass:[TwoLBTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.sectionFooterHeight =110;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 4;
    }else
    {
        return 2;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TwoLBTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.section ==0) {
        cell.lb.text = arrOne[indexPath.row];
        cell.datlb.text =@"gayufguagfuisg_材料";
    }else
    {
        
        cell.lb.text =arrTwo[indexPath.row];
        cell.datlb.text =@"你是女装大佬";
    }
   
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 55;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    EasyHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headid];
    if(!sectionHeadView){
        
        sectionHeadView = [[EasyHeadView alloc] initWithReuseIdentifier:headid];
        sectionHeadView.datlb.text =@"";
    }
    return sectionHeadView;
    
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    
    TendBaseViewHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footid];
    if(!sectionHeadView){
        
        sectionHeadView = [[TendBaseViewHeadView alloc] initWithReuseIdentifier:footid];
        
        if (section ==0) {
             sectionHeadView.lbl.text =@"发现问题";
        }else{
        sectionHeadView.lbl.text =@"处理结果";
        }
    }
    return sectionHeadView;
    
}



- (CGFloat)tableView:(UITableView *)tableView HeightForFooterInSection:(NSInteger)section
{
    
    return 147;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    return 1;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
