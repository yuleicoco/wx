//
//  ProViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/19.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ProViewController.h"
#import "ProTableViewCell.h"
#import "proHearview.h"


static NSString * cellId = @"proTabid";
@interface ProViewController ()<ChooseViewDelegate,DateviewDelegate>

@property (nonatomic,strong)DateView * daVW;
@property (nonatomic,strong)ChooseView * chooseVW;
@property (nonatomic,strong)ProInforViewController * ProVC;


@end

@implementation ProViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"home_tab_pro", nil)];
}

- (void)SetupView
{
    [super SetupView];
    
    // 蓝色
    UILabel * lineOne =[UILabel new];
    lineOne.backgroundColor = Blue_color;
    [self.view addSubview:lineOne];
    [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view).offset(8);
        make.size.mas_equalTo(CGSizeMake(4, 16));
    }];
    // 项目名字
    UILabel * LogName =[UILabel new];
    LogName.font = Ping_R(16);
    LogName.textColor = Gray_color;
    LogName.text =@"重庆川仪项目";
    [self.view addSubview:LogName];
    
    [LogName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(lineOne.mas_right).offset(7);
        make.height.equalTo(@16);
    }];
    //
    UIButton * spBtn =[UIButton new];
    [spBtn setImage:[UIImage imageNamed:@"do_log_choo"] forState:UIControlStateNormal];
    [spBtn addTarget:self action:@selector(SpBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:spBtn];
    
    [spBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view.mas_right).offset(-14);
        make.size.mas_equalTo(CGSizeMake(10, 16));
        
    }];
    
    UILabel * lineTwo =[UILabel new];
    lineTwo.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineTwo];
    [lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(48);
        make.height.equalTo(@1);
        make.left.right.equalTo(self.view).offset(0);
        
        
    }];
    //
    
    UILabel * DateLB =[UILabel new];
    DateLB.text =@"日期";
    DateLB.font =Ping_R(16);
    [self.view addSubview:DateLB];
    [DateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(74);
        make.left.equalTo(self.view).offset(14);
        make.size.mas_equalTo(CGSizeMake(34, 15));
        
    }];
    
    NSMutableArray * arrBtn =[NSMutableArray new];
    for (NSInteger i = 0; i <2; i++) {
        UIButton * btn =[[UIButton alloc]init];
        btn.backgroundColor =[UIColor whiteColor];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        
        
        
        btn.tag = 6666+i;
        [btn setBackgroundImage:[UIImage imageNamed:@"do_log_box"] forState:UIControlStateNormal];
        [btn setTitle:@"2018-2-18" forState:UIControlStateNormal];
        [btn setTitleColor:Gray_color forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(Date_btn:) forControlEvents:UIControlEventTouchUpInside];
        [arrBtn addObject:btn];
        [self.view addSubview:btn];
    }
    
    [arrBtn mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:27 leadSpacing:53 tailSpacing:11];
    [arrBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@63);
        make.height.equalTo(@38);
        
    }];
    
    UILabel * lineTh =[UILabel new];
    lineTh.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineTh];
    [lineTh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineTwo.mas_bottom).offset(31);
        make.left.equalTo(DateLB.mas_right).offset(158);
        make.size.mas_equalTo(CGSizeMake(9, 2));
        
    }];
    
    
    UILabel * lineFor =[UILabel new];
    lineFor.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineFor];
    [lineFor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(115);
        make.height.equalTo(@5);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    
    
    // tab
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineFor.mas_bottom).offset(0);
        make.right.and.left.and.bottom.equalTo(self.view).offset(0);
        
    }];
    
    [self.tableView registerClass:[ProTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    
}

- (void)SpBtn:(UIButton *)sender
{
    [self.view addSubview:self.chooseVW];
    [self.chooseVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
}

- (void)Date_btn:(UIButton *)sender
{
    [self.view addSubview:self.daVW];
    [self.daVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
}

#pragma mark - Get and Set
- (ProInforViewController *)ProVC{
    if (_ProVC == nil) {
        _ProVC = [[ProInforViewController alloc] init];
    }
    return _ProVC;
}




- (DateView *)daVW{
    if (_daVW == nil) {
        _daVW = [[DateView alloc] init];
        _daVW.delegate = self;
    }
    return _daVW;
}

- (ChooseView *)chooseVW{
    if (_chooseVW == nil) {
        _chooseVW = [[ChooseView alloc] init];
        _chooseVW.delegate = self;
    }
    return _chooseVW;
}

#pragma MARK---------------------choose协议

- (void)SureC
{
    
    [self.chooseVW removeFromSuperview];
}
- (void)CanceC
{
    
    [self.chooseVW removeFromSuperview];
}

#pragma MARK---------------------Date协议

- (void)SureB
{
    [self.daVW removeFromSuperview];
    
}
- (void)CanceB
{
    [self.daVW removeFromSuperview];
    
    
}
#pragma MARK---------------------tab协议

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
    return 119;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ProTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
   
    cell.LogName.text =@"重庆川仪项目";
    cell.LogDate.text =@"2018-2-13";
    cell.LogPerson.text =@"负责人:余磊";
    cell.LogIntro.text =@"现场文明试岗爱爱后方好好好哦啊好哦啊后你把护发偶吼吼啊哈 fakflkahFAFNAKJHFLAFLn哈佛号阿凡达事故发生的故事告诉";
    cell.isOver.text =@"未完成";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;

}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    static NSString *viewIdentfier = @"proheadView";
    proHearview *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    if(!sectionHeadView){
        
        sectionHeadView = [[proHearview alloc] initWithReuseIdentifier:viewIdentfier];
    }
    return sectionHeadView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 43;
    
}

// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self.navigationController pushViewController:self.ProVC animated:YES];
    
    
    NSLog(@"222");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
