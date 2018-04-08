//
//  PackPayViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PackPayViewController.h"
#import "Charts/Charts.h"
#import "ChooseView.h"
#import "PackListViewController.h"

@interface PackPayViewController ()<ChartViewDelegate,ChooseViewDelegate>
{
    
   
}
@property(nonatomic,strong)PieChartView * pieChartView;
@property(nonatomic,strong) PieChartData *data;
@property(nonatomic,strong)ChooseView * chooseView;



@end


@implementation PackPayViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"all_vc_two", nil)];
    
    [self showBarButton:NAV_RIGHT title:@"列表展示" fontColor:Gray_color_255 font:Ping_R(14) hide:NO];
    

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
    
    // 支出金额
    UILabel * monye =[UILabel new];
    monye.text =@"支出总金额(元)";
    monye.font = Ping_R(14);
    monye.textColor = Gray_color_55;
    [self.view addSubview:monye];
    
    [monye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineTwo.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 13.5));
        
    }];
    
    
    UILabel * monyelb =[UILabel new];
    monyelb.text =@"400293429.00";
    monyelb.font = Ping_B(32);
    monyelb.textColor = RGB(320, 130, 71);
    monyelb.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:monyelb];
    
    [monyelb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(monye.mas_bottom).offset(11);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(230, 24.5));
        
    }];
    
    // 饼状图
    self.pieChartView = [[PieChartView alloc] init];
    self.pieChartView.delegate = self;
    [self.view addSubview:self.pieChartView];
    
    [self.pieChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(monyelb.mas_bottom).offset(21);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(320, 320));
    }];
    
    [self.pieChartView setExtraOffsetsWithLeft:30 top:0 right:30 bottom:0];//饼状图距离边缘的间隙
    self.pieChartView.usePercentValuesEnabled = YES; //是否根据所提供的数据, 将显示数据转换为百分比格式
    self.pieChartView.dragDecelerationEnabled = YES;//拖拽饼状图后是否有惯性效果
    self.pieChartView.drawCenterTextEnabled = YES;  //是否显示区块文本
    self.pieChartView.chartDescription.text =@"XX项目阶段费用                ";
    self.pieChartView.chartDescription.textColor = Gray_color_55;
    self.pieChartView.chartDescription.font = Ping_R(14);
    self.pieChartView.chartDescription.textAlign = NSTextAlignmentRight;
  
    //实心饼状图样式
    self.pieChartView.drawHoleEnabled = NO;
    //饼状图中间描述
    if (self.pieChartView.isDrawHoleEnabled == YES) {
        self.pieChartView.drawCenterTextEnabled = YES; //是否显示中间文字
        //普通文本
        //        self.pieChartView.centerText = @"饼状图";//中间文字
        //富文本
        NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"饼状图"];
        [centerText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor orangeColor]} range:NSMakeRange(0, centerText.length)];
        self.pieChartView.centerAttributedText = centerText;
    }
    //饼状图描述 Description Label
    //  self.pieChartView.descriptionText = @"饼状图示例";
    
    //饼状图图例
    self.pieChartView.legend.maxSizePercent = 1;//图例在饼状图中的大小占比, 这会影响图例的宽高
    self.pieChartView.legend.formToTextSpace = 5;//文本间隔
    self.pieChartView.legend.font = [UIFont systemFontOfSize:10];//字体大小
    self.pieChartView.legend.textColor = [UIColor grayColor];//字体颜色
    self.pieChartView.legend.form = ChartLegendFormLine;//图示样式: 方形、线条、圆形
    self.pieChartView.legend.formSize = 20;//图示大小
    //为饼状图提供数据
    self.data = [AppUtil setData];
    self.pieChartView.data = self.data;
    //设置动画效果
    [self.pieChartView animateWithXAxisDuration:1.0f easingOption:ChartEasingOptionEaseOutExpo];
    
}

- (void)SpBtn:(UIButton *)sender
{
    _chooseView =[[ChooseView alloc]init];
    _chooseView.delegate = self;
    [self.view addSubview:_chooseView];
    
    [_chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
}

- (void)doRightButtonTouch
{
    PackListViewController * list =[[PackListViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
    
}

#pragma MARK---------------------choose协议

- (void)SureC
{
    
    [_chooseView removeFromSuperview];
}
- (void)CanceC
{
    [_chooseView removeFromSuperview];
}

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    
    NSLog(@"hha");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
