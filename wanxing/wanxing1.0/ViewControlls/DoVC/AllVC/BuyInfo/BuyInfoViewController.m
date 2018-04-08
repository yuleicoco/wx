//
//  BuyInfoViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/8.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BuyInfoViewController.h"
#import "BuyInforTableViewCell.h"
#import "Info_infoViewController.h"


static NSString * cellId = @"buyinfoTabid";

@interface BuyInfoViewController ()<DateviewDelegate>
{
    
    BOOL isFirst;
}
@property (nonatomic,strong)DateView * daVW;
@end

@implementation BuyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"xxxx项目"];
    [self showBarButton:NAV_RIGHT imageName:@"job_search"];
    isFirst = NO;
    
    
}

- (void)SetupView
{
    [super SetupView];
    
    UILabel * DateLB =[UILabel new];
    DateLB.text =@"日期";
    DateLB.font =Ping_R(17);
    DateLB.textColor = Gray_color_128;
    [self.view addSubview:DateLB];
    [DateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(16);
        make.left.equalTo(self.view).offset(11);
        make.size.mas_equalTo(CGSizeMake(34, 16));
        
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
        make.top.equalTo(self.view).offset(8);
        make.height.equalTo(@34);
        
    }];
    
    UILabel * lineTh =[UILabel new];
    lineTh.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineTh];
    [lineTh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(23);
        make.left.equalTo(DateLB.mas_right).offset(158);
        make.size.mas_equalTo(CGSizeMake(9, 2));
        
    }];
    
    UILabel * lineFor =[UILabel new];
    lineFor.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineFor];
    [lineFor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(DateLB.mas_bottom).offset(18);
        make.height.equalTo(@5);
        make.left.right.equalTo(self.view).offset(0);
        
    }];
    
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineFor.mas_bottom).offset(0);
        make.right.and.left.equalTo(self.view).offset(0);
        make.height.mas_equalTo(SCREEN_HEIGHT);
    }];
    
    [self.tableView registerClass:[BuyInforTableViewCell class] forCellReuseIdentifier:cellId];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

- (void)Date_btn:(UIButton *)sender
{
    NSInteger tag  = sender.tag -6666;
    
    [self LoadDateView];
    
}

// 加载时间控件
- (void)LoadDateView
{
    
    _daVW =[[DateView alloc]init];
    _daVW.delegate = self;
    [self.view addSubview:_daVW];
    
    [_daVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
}

- (void)SureB
{
    
    [_daVW removeFromSuperview];
}
- (void)CanceB
{
    
    [_daVW removeFromSuperview];
}


#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return 6;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BuyInforTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.LogName.text =@"重庆川仪项目";
    cell.LogDate.text =@"2018-2-13";
    cell.LogPerson.text =@"负责人:余磊";
    cell.LogIntro.text =@"现场文明试岗爱爱后方好好好哦啊好哦啊后你把护发偶吼吼啊哈哈佛号";
    
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}

- (void)doRightButtonTouch
{
    NSLog(@"搜索");
    if (isFirst ==NO) {
        [self showBarButton:NAV_RIGHT title:@"取消" fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
        
        UISearchBar * bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 250, 40)];
        bar.placeholder =@"请输入材料名称";
        UIImage *searchIcon = [UIImage imageNamed:@"house_cl"];
        [bar setImage:searchIcon forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        self.navigationItem.titleView=bar;
        isFirst =YES;
    }else
    {
        self.navigationItem.titleView = nil;
        [self setNavTitle:@"一号仓库"];
        [self showBarButton:NAV_RIGHT imageName:@"house_saech"];
    }
        
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Info_infoViewController * vc =[[Info_infoViewController alloc]init
                                   ];
    [self.navigationController  pushViewController:vc animated:YES];
    
 
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
