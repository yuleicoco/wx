
//
//  MycodeViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "MycodeViewController.h"
#import "jobTabCell.h"
#import "deleView.h"

static NSString * cellId = @"caoTabid";
@interface MycodeViewController ()<DeViewDelegate>
{
    NSInteger selectRow;
}

@property(nonatomic,strong)deleView * deview;


@end

@implementation MycodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavTitle:NSLocalizedString(@"me_vc_text", nil)];
    [self showBarButton:NAV_RIGHT imageName:@"job_add"];
}

- (void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.and.right.and.bottom.equalTo(self.view).offset(0);
    }];
    [self.tableView registerClass:[jobTabCell class] forCellReuseIdentifier:cellId];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
        self.deview =[[deleView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 62)];
        self.deview.delegate = self;
        self.deview.backgroundColor =[UIColor whiteColor];
        [self.view addSubview:self.deview];
    
    
    
}
#pragma MARK---------------------dele协议^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- (void)upviw
{
    
    FuckLog(@"提交");
}

- (void)deleview
{
    FuckLog(@"删除");
    
}





#pragma MARK---------------------TAB协议^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 6;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    jobTabCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[jobTabCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    cell.contentView.userInteractionEnabled = YES;
    cell.LogName.text =@"重庆川仪项目";
    cell.LogDate.text =@"2018-2-13";
    cell.LogPerson.text =@"创建人:余磊 |计划结束:2-28 8:40";
    cell.LogIntro.text =@"现场文明试岗爱爱后方好好好哦啊好哦啊后你把护发偶吼吼啊哈哈佛号";
    cell.isOver.text =@"正在执行";
    cell.btn.hidden =YES;
    [cell.btn  addTarget:self action:@selector(houxua:) forControlEvents:UIControlEventTouchUpInside];
    UILongPressGestureRecognizer * longPressGesture =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(cellLongPress:)];
    longPressGesture.minimumPressDuration=1.5f;//设置长按 时间
    [cell addGestureRecognizer:longPressGesture];
    
  
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor =RGB(243, 247, 249);
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}

- (void)cellLongPress:(UILongPressGestureRecognizer *)sender
{
    NSArray *arr = [self.tableView indexPathsForVisibleRows];
    for (NSIndexPath *indexPath in arr) {
        //根据索引，获取cell 然后就可以做你想做的事情啦
        jobTabCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        //我这里要隐藏cell 的图片
        cell.btn.hidden = NO;
    }
    
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:location];
    jobTabCell *nextCell = [self.tableView cellForRowAtIndexPath:indexPath];
    [nextCell.btn setImage:[UIImage imageNamed:@"log_cell_choose"] forState:UIControlStateNormal];
    
    
    [self showView];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    jobTabCell *nextCell = [self.tableView cellForRowAtIndexPath:indexPath];
    selectRow = indexPath.row;
  
  
    
}


- (void)showView
{
    
    [UIView animateWithDuration:0.5 animations:^{
        // 设置view弹出来的位置
        [self.deview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.view).offset(0);
            make.top.equalTo(self.view.mas_bottom).offset(-63);
            make.height.equalTo(@62);
        }];
    }];
    
    
}

- (void)houxua:(UIButton *)sender
{
    sender.selected = !sender.selected;
    FuckLog(@"1");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
