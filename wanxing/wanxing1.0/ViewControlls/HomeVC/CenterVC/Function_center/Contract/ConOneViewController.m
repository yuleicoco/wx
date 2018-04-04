//
//  ConOneViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ConOneViewController.h"
#import "TendBaseViewHeadView.h"

static NSString * cellId = @"conTabid";
static NSString * footId = @"conTabid";

@interface ConOneViewController ()
{
    NSMutableArray * arr;
    CaiHeaderView * caifoot;
}

@end

@implementation ConOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)SetupData
{
    [super SetupData];
    arr =[NSMutableArray arrayWithObjects:@"项目",@"合同编号",@"合同名称",@"施工地点",@"建设单位",@"签订日期",@"工程类别",@"总包单位",@"设计单位",@"监理单位",@"招标单位",@"甲方",@"甲方法人",@"甲方负责人",@"负责人电话",@"乙方",@"乙方负责人",@"计划开工时间",@"计划竣工时间",@"实际开工时间",@"实际竣工时间",nil];
    

    
    
}


- (void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self.view).offset(0);
        
    }];
    [self.tableView registerClass:[CaiTableViewCell class] forCellReuseIdentifier:cellId];
     self.tableView.sectionFooterHeight =120;
    
    
}

#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0 ) {
          return arr.count;
    }else{
        return 0;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CaiTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.lb.text = arr[indexPath.row];
    cell.dalb.text =@"哈哈我是";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    
    TendBaseViewHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footId];
    
    if(!sectionHeadView){
        
        sectionHeadView = [[TendBaseViewHeadView alloc] initWithReuseIdentifier:footId];
        switch (section) {
            case 0:
                sectionHeadView.lbl.text =@"合同内容";
                break;
            case 1:
                sectionHeadView.lbl.text =@"合同约束";
                break;
            case 2:
                sectionHeadView.lbl.text =@"备注内容";
                break;
                
            default:
                break;
        }
    }
    
    return sectionHeadView;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    self.tableView.contentSize =CGSizeMake(0,1700);
    
    
    if (scrollView == self.tableView)
    {
        UITableView *tableview = (UITableView *)scrollView;
        CGFloat sectionHeaderHeight = 64;
        CGFloat sectionFooterHeight = 110;
        CGFloat offsetY = tableview.contentOffset.y;
        if (offsetY >= 0 && offsetY <= sectionHeaderHeight)
        {
            tableview.contentInset = UIEdgeInsetsMake(-offsetY, 0, -sectionFooterHeight, 0);
            
        }else if (offsetY >= sectionHeaderHeight && offsetY <= tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight)
        {
            tableview.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, -sectionFooterHeight, 0);
        }else if (offsetY >= tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight && offsetY <= tableview.contentSize.height - tableview.frame.size.height)
        {
            tableview.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(tableview.contentSize.height - tableview.frame.size.height - sectionFooterHeight), 0);
        }
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
