//
//  Single_infoViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/31.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "Single_infoViewController.h"
#import "singleHeadView.h"
#import "SingleTableViewCell.h"
#import "CaiHeaderView.h"

static NSString * cellId = @"singecellTabid";
@interface Single_infoViewController ()
{
    
    NSMutableArray * SecionArr; // 分区
    NSMutableArray * cellArr;  // cell
    NSMutableArray * lbar;
    NSMutableArray * lbarTwo;
}

@end

@implementation Single_infoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self setNavTitle:@"xx费用报销"];
}


-(void)SetupData
{
    [super SetupData];
    lbar =[NSMutableArray arrayWithObjects:@"报销人",@"人员部门",@"总金额",@"报销时间",@"审核状态",nil];
    lbarTwo =[NSMutableArray arrayWithObjects:@"打车(金额：元)",@"人员部门",@"总金额",@"报销时间",nil];
    SecionArr = [[NSMutableArray alloc] initWithObjects:@"费用项目",@"项目名称", nil];
    
}

- (void)SetupView
{
    [super SetupView];
    
 
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.and.bottom.equalTo(self.view).offset(0);
    }];
    [self.tableView registerClass:[SingleTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.estimatedRowHeight = 55;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}
#pragma mark-------------tab

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SecionArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        
        return 4;
    }else
    {
        
        return 5;
        
    }
 
   
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.section ==0) {
        
        if (indexPath.row ==3) {
            cell.lb.text =@"";
            cell.datalb.text =@"";
            cell.backgroundColor =Gray_color_uibrother;
        }else{
        cell.lb.text =lbarTwo[indexPath.row];
        cell.datalb.text =@"asd";
        }
    
    }else
    {
        
        cell.lb.text = lbar[indexPath.row];
        cell.datalb.text =@"asd";
    }
    
    return cell;
}

+ (NSMutableAttributedString *)InputArString:(NSString *)str
{
    NSMutableAttributedString * astring =[[NSMutableAttributedString alloc]initWithString:str];
    [astring addAttribute:NSForegroundColorAttributeName value:RGB(122, 121, 121) range:NSMakeRange(0,10)];
    [astring addAttribute:NSForegroundColorAttributeName value:RGB(170, 170, 170) range:NSMakeRange(10,7)];
    [astring addAttribute:NSFontAttributeName value:Ping_R(16) range:NSMakeRange(0, 10)];
    [astring addAttribute:NSFontAttributeName value:Ping_R(12) range:NSMakeRange(10, 7)];
    return astring;
    
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    static NSString *viewIdentfier = @"singleheard";
    singleHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    if(!sectionHeadView){
        
        sectionHeadView = [[singleHeadView alloc] initWithReuseIdentifier:viewIdentfier];
       // sectionHeadView.backgroundView.backgroundColor =[UIColor redColor];
        sectionHeadView.layer.borderWidth =0.7;
        sectionHeadView.layer.borderColor = Gray_color_uibrother.CGColor;
    }
    return sectionHeadView;
    
    
    
}

- (void)Mark_in:(UIButton *)sender {
    NSInteger section = sender.tag;
  
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGFloat heightForHeader = 40;
        
        if(scrollView.contentOffset.y <= heightForHeader && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }else if(scrollView.contentOffset.y >= heightForHeader) {
            scrollView.contentInset = UIEdgeInsetsMake(-heightForHeader, 0, 0, 0);
        }
    }
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0 && indexPath.row ==3) {
        
        return 5;
        
    }else
    {
        
        return 55;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 45;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    

    static NSString *viewIdentfier = @"caiheard";
    CaiHeaderView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    if(!sectionHeadView){
        
        sectionHeadView = [[CaiHeaderView alloc] initWithReuseIdentifier:viewIdentfier];
        sectionHeadView.backgroundView.backgroundColor =[UIColor redColor];
    }
    return sectionHeadView;
 
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    
    if (section == 0) {
        return  0;
    }else{
    return 110;
    }
    
}



- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section{
    if ([view isMemberOfClass:[singleHeadView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor clearColor];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
