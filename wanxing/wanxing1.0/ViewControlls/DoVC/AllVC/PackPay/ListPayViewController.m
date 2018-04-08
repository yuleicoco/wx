//
//  ListPayViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/8.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ListPayViewController.h"
#import "CaiTableViewCell.h"
#import "PayListHeadView.h"


static NSString * cellId = @"listPayTabid";
@interface ListPayViewController ()

@end

@implementation ListPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setNavTitle:@"xxxx项目"];
}

- (void)SetupView
{
    [super  SetupView];
    
    // 项目名字
    UILabel * LogName =[UILabel new];
    LogName.font = Ping_R(16);
    LogName.textColor = Gray_color;
    LogName.text =@"总金额";
    [self.view addSubview:LogName];
    
    [LogName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view).offset(9);
        make.height.equalTo(@16);
    }];
    //
    UILabel * spBtn =[UILabel new];
    spBtn.font = Ping_R(14);
    spBtn.textColor = Gray_color_128;
    spBtn.text =@"27877204.00";
    spBtn.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:spBtn];
    
    [spBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(120, 11));
        
    }];
    
    UILabel * lineTwo =[UILabel new];
    lineTwo.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineTwo];
    [lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(48);
        make.height.equalTo(@5);
        make.left.right.equalTo(self.view).offset(0);
        
            }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(lineTwo.mas_bottom).offset(0);
        
    }];
    [self.tableView registerClass:[CaiTableViewCell class]  forCellReuseIdentifier:cellId];
    self.tableView.estimatedRowHeight = 55;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 3;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CaiTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.lb.text = @"胡夏建设集团";
    cell.dalb.text =@"200000.00";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = view_bg;
    
    return cell;
    
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    static NSString *viewIdentfier = @"lsitheard";
    PayListHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    if(!sectionHeadView){
        
        sectionHeadView = [[PayListHeadView alloc] initWithReuseIdentifier:viewIdentfier];
        sectionHeadView.backgroundView.backgroundColor =[UIColor redColor];
    }
    sectionHeadView.btnMess.tag = section;
    [sectionHeadView.btnMess addTarget:self action:@selector(Mark_in:) forControlEvents:UIControlEventTouchUpInside];
    return sectionHeadView;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 42;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
