//
//  oneViewViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "oneViewViewController.h"
#import "CaiHeaderView.h"


static NSString * cellId = @"payTabid";

@interface oneViewViewController ()
{
    NSMutableArray * arr;
    CaiHeaderView * caifoot;
    
    
}

@end

@implementation oneViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arr =[NSMutableArray arrayWithObjects:@"项目",@"合同编号",@"合同名称",@"申请编号",@"期间",@"申报日期",@"结算方式",@"银行账户",@"收款方",@"收款人",@"审核金额",@"实付金额",@"累计实付金额",nil];
   
}


- (void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self.view).offset(0);
        
    }];
    [self.tableView registerClass:[CaiTableViewCell class] forCellReuseIdentifier:cellId];
     self.tableView.tableFooterView =[[CaiHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    self.tableView.estimatedRowHeight = 55;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
   
}

#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return arr.count;
    
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


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    //    DoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
 
}


//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//    static NSString *viewIdentfier = @"caiheard";
//    CaiHeaderView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
//    if(!sectionHeadView){
//
//        sectionHeadView = [[CaiHeaderView alloc] initWithReuseIdentifier:viewIdentfier];
//        sectionHeadView.backgroundView.backgroundColor =[UIColor redColor];
//    }
//    return sectionHeadView;
//
//}


/*
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    
    return 1010;
    
}
 */

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(nonnull UIView *)view forSection:(NSInteger)section {
    if ([view isMemberOfClass:[CaiHeaderView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor clearColor];
    }
}


// 禁止下拉
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        CGFloat offY = scrollView.contentOffset.y;
        if (offY < 0) {
            scrollView.contentOffset = CGPointZero;
        }
    }
}


/*
- (void)scrollsToBottomAnimated:(BOOL)animated
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:arr.count-1 inSection:0]  atScrollPosition:UITableViewScrollPositionBottom animated:NO];//这里一定要设置为NO，动画可能会影响到scrollerView，导致增加数据源之后，tableView到处乱跳
}


- (void)scrollViewToBottom:(BOOL)animated
{
    if (self.tableView.contentSize.height > self.tableView.frame.size.height)
    {
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        [self.tableView setContentOffset:offset animated:animated];
    }
}
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
