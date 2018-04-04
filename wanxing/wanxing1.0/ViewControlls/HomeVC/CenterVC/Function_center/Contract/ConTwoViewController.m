//
//  ConTwoViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ConTwoViewController.h"
#import "TendBaseViewHeadView.h"
#import "CaiTableViewCell.h"


static NSString * cellId = @"cononeTabid";
static NSString * footId = @"cononeTabid";
@interface ConTwoViewController ()
{
    NSMutableArray * arr;
    NSMutableArray * arrOne;
    
}

@end

@implementation ConTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)SetupData
{
    [super SetupData];
    arr =[NSMutableArray arrayWithObjects:@"合同总金额",@"合同价款方式",@"含预留金",@"决定申报金额",@"决算申报金额",@"实收金额",nil];
    arrOne =[NSMutableArray arrayWithObjects:@"决算申报时间",@"决算审定时间",@"履约保证金",@"履约金缴纳时间",@"履约金退换时间",@"安全保证金",@"安保金缴纳时间",@"质量保证金",@"质量保修期",@"质保金退换时间",nil];
    

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0 ) {
        return arr.count;
    }else{
        return arrOne.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CaiTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (indexPath.section == 0) {
        cell.lb.text = arr[indexPath.row];
        cell.dalb.text =@"1321241241414";
    }else
    {
        cell.lb.text = arrOne[indexPath.row];
        cell.dalb.text =@"2080+78=12";
    }
   
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
        sectionHeadView.lbl.text  =@"收款说明";
    }
    
    return sectionHeadView;
    
}

 - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
 
 {
     if (section == 0) {
         
         return 110;
     }else
     {
           return 0;
     }
 
 }

-(void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    self.tableView.contentSize =CGSizeMake(0,1000);
    
}
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
