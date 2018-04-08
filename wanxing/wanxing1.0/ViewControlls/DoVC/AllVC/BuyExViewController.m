//
//  BuyExViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BuyExViewController.h"
#import "DateView.h"
#import "BuyInfoViewController.h"


@interface BuyExViewController ()<ChartViewDelegate,DateviewDelegate,ChooseViewDelegate>

@property(nonatomic,strong)PieChartView * pieChartView;
@property(nonatomic,strong) PieChartData *data;
@property (nonatomic,strong)DateView * daVW;


@end

@implementation BuyExViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setNavTitle:NSLocalizedString(@"all_vc_one", nil)];
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
    // 支出金额
    UILabel * monye =[UILabel new];
    monye.text =@"支出总金额(元)";
    monye.font = Ping_R(14);
    monye.textColor = Gray_color_55;
    [self.view addSubview:monye];
    
    [monye mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineFor.mas_bottom).offset(20);
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
    //空心饼状图样式
    
    /*
    self.pieChartView.drawHoleEnabled = YES; //饼状图是否是空心
    self.pieChartView.holeRadiusPercent = 0.5; //空心半径占比
    self.pieChartView.holeColor = [UIColor clearColor]; //空心颜色
    self.pieChartView.transparentCircleRadiusPercent = 0.52; //半透明空心半径占比
    self.pieChartView.transparentCircleColor = [UIColor colorWithRed:210/255.0 green:145/255.0 blue:165/255.0 alpha:0.3]; //半透明空心的颜色
     */
    
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
    self.data = [self setData];
    self.pieChartView.data = self.data;
    
    //设置动画效果
    [self.pieChartView animateWithXAxisDuration:1.0f easingOption:ChartEasingOptionEaseOutExpo];
    
     
}

- (PieChartData *)setData{
    
    double mult = 100;
    int count = 5;//饼状图总共有几块组成
    
    //每个区块的数据
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++) {
        double randomVal = arc4random_uniform(mult + 1);
        PieChartDataEntry *entry =[[PieChartDataEntry alloc] initWithValue:randomVal label:[NSString stringWithFormat:@"第%d个", i+1]];
        
        [yVals addObject:entry];
    }
    //dataSet
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc]initWithValues:yVals label:@"Election Results"];
    dataSet.drawValuesEnabled = YES;//是否绘制显示数据
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    [colors addObjectsFromArray:ChartColorTemplates.joyful];
    [colors addObjectsFromArray:ChartColorTemplates.colorful];
    [colors addObjectsFromArray:ChartColorTemplates.liberty];
    [colors addObjectsFromArray:ChartColorTemplates.pastel];
    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    dataSet.colors = colors;//区块颜色
    dataSet.sliceSpace = 3;//相邻区块之间的间距
    dataSet.selectionShift = 8;//选中区块时, 放大的半径
    dataSet.xValuePosition = PieChartValuePositionInsideSlice;//名称位置
    dataSet.yValuePosition = PieChartValuePositionOutsideSlice;//数据位置
    //数据与区块之间的用于指示的折线样式
    dataSet.valueLinePart1OffsetPercentage = 0.85;//折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
    dataSet.valueLinePart1Length = 0.5;//折线中第一段长度占比
    dataSet.valueLinePart2Length = 0.4;//折线中第二段长度最大占比
    dataSet.valueLineWidth = 1;//折线的粗细
    dataSet.valueLineColor = [UIColor brownColor];//折线颜色
    
    //data
    PieChartData *data = [[PieChartData alloc]initWithDataSet:dataSet];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterPercentStyle;
    formatter.maximumFractionDigits = 0;//小数位数
    formatter.multiplier = @1.f;
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:formatter]];
    [data setValueTextColor:[UIColor brownColor]];
    [data setValueFont:[UIFont systemFontOfSize:10]];
    
    return data;
}

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    
    NSLog(@"hha");
    BuyInfoViewController * info =[[BuyInfoViewController alloc]init];
    [self.navigationController pushViewController:info animated:YES];
    
}


// 加载时间控件
- (void)Date_btn:(UIButton *)sender
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

#pragma MARK---------------------Date协议

- (void)SureB
{
    [_daVW removeFromSuperview];
    
}
- (void)CanceB
{
    [_daVW removeFromSuperview];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
