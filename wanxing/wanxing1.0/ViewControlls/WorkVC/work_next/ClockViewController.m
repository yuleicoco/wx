//
//  ClockViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/22.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ClockViewController.h"
#import "ClockHistoryViewController.h"

@interface ClockViewController ()

@property (nonatomic,strong)UILabel * timeHour;
@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic,assign)BOOL isGoOff;
@property (nonatomic,assign)BOOL isFirst;



@end

@implementation ClockViewController
@synthesize bgview;
@synthesize lineR;
@synthesize linetwo;
@synthesize lineth;
@synthesize ima;
@synthesize timelb;
@synthesize lineone;
@synthesize aralb;
@synthesize aralboff;
@synthesize linefo;
@synthesize lineRt;
@synthesize timeld;
@synthesize btn;












- (void)viewDidLoad {
    [super viewDidLoad];
    self.isGoOff= NO;
    self.isFirst = YES;
    self.view.backgroundColor =[UIColor whiteColor];
    [self setNavTitle:NSLocalizedString(@"work_q_c", nil)];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"work_nav", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}


-(void)GCDmehtod{
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    
    // 设置回调
    dispatch_source_set_event_handler(self.timer, ^{
        self.timeHour.attributedText =[ClockViewController TimeArString:[AppUtil getCurrentTime]] ;
    });
    dispatch_resume(self.timer);
}


-(void)SetupView
{
    [super SetupView];
    
    UIImageView * imaHead =[UIImageView  new];
    imaHead.layer.masksToBounds = YES;
    imaHead.image = [UIImage imageNamed:@"tse.jpg"];
    imaHead.layer.cornerRadius = 57/2;
    imaHead.layer.borderWidth =2;
    imaHead.layer.borderColor = Gray_color_uibrother.CGColor;
    [self.view addSubview:imaHead];
    [imaHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(18);
        make.size.mas_equalTo(CGSizeMake(57, 57));
        
    }];
    
    // name
    
    UILabel * namelb =[UILabel new];
    namelb.font =Ping_M(16);
    namelb.text =@"尼古拉斯凯奇";
    [self.view addSubview:namelb];
   
    [namelb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imaHead.mas_right).offset(12);
        make.top.equalTo(self.view).offset(25);
        make.size.mas_equalTo(CGSizeMake(100, 15));
    }];
    
    UILabel * prolb =[UILabel new];
    prolb.font = Ping_R(11.5);
    prolb.text =@"环球影业制片厂考情组";
    prolb.textColor = Gray_color_uibrother;
    [self.view addSubview:prolb];
    
    [prolb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imaHead.mas_right).offset(12);
        make.top.equalTo(namelb.mas_bottom).offset(8);
        make.size.mas_equalTo(CGSizeMake(140, 11.5));
        
    }];
    
    
//  日期
    
    UILabel * datelb =[UILabel new];
    datelb.font  = Ping_M(12);
    datelb.textColor = RGB(147, 146, 146);
    datelb.text =@"2018-03-6";
    datelb.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:datelb];
    [datelb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-12);
        make.top.equalTo(self.view).offset(23);
        make.size.mas_equalTo(CGSizeMake(80, 9.5));
        
    }];
    
    
    UILabel * weeklb =[UILabel new];
    weeklb.font  = Ping_R(12);
    weeklb.text = @"星期三";
    weeklb.textColor = RGB(140, 140, 140);
    weeklb.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:weeklb];
    
    [weeklb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-12);
        make.top.equalTo(datelb.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(40, 10.5));
        
    }];
    
 
     lineone =[UIImageView new];
     lineone.image =[UIImage imageNamed:@"clock_lineone"];
    [self.view addSubview:lineone];
    [lineone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(34);
        make.top.equalTo(imaHead.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(1.5, 23));
        
    }];
    
    
    // **********************************************可变约束控件*******************************************
    
    bgview=[UIView new];
    bgview.backgroundColor = RGB(233, 243, 248);
    [self.view addSubview:bgview];
    
    
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineone.mas_bottom).offset(0);
        make.left.right.equalTo(self.view).offset(0);
        make.height.equalTo(@391);
        
    }];
    
    linetwo =[UIImageView new];
    linetwo.image =[UIImage imageNamed:@"clock_linetwo"];
    [bgview addSubview:linetwo];
    [linetwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgview).offset(34);
        make.top.equalTo(bgview).offset(0);
        make.size.mas_equalTo(CGSizeMake(1.5, 27));
        
    }];
    
    lineR =[UIImageView new];
    lineR.image =[UIImage imageNamed:@"work_point"];
    [bgview addSubview:lineR];
    [lineR mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgview).offset(32);
        make.top.equalTo(bgview).offset(27);
        make.size.mas_equalTo(CGSizeMake(7, 7));
        
    }];
    
    timelb =[UILabel new];
    NSString * str = @"上班时间 09：00 (尚未打卡)";
    timelb.attributedText  = [ClockViewController InputArString:str];
    [bgview addSubview:timelb];
    [timelb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineR.mas_right).offset(6);
        make.top.equalTo(bgview).offset(24);
        make.size.mas_equalTo(CGSizeMake(250, 15));
    }];
    aralb =[UILabel new];
    aralb.text =@"地点:中南海会议中心B20";
    aralb.font = Ping_R(13);
    aralb.hidden = YES;
    aralb.textColor = RGB(170, 170, 170);
    [bgview addSubview:aralb];
    [aralb mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineR.mas_right).offset(6);
            make.top.equalTo(timelb.mas_bottom).offset(5);
            make.size.mas_equalTo(CGSizeMake(220, 12.5));
    }];
    
    
    
    lineth =[UIImageView new];
    lineth.image =[UIImage imageNamed:@"clock_lineth"];
    [bgview addSubview:lineth];
    [lineth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgview).offset(34);
        make.top.equalTo(lineR.mas_bottom).offset(0);
        make.bottom.equalTo(bgview).offset(0);
        make.width.equalTo(@1.5);
        
    }];
    
    ima =[UIImageView new];
    ima.image =[UIImage imageNamed:@"clock_qu"];
    [self.view  addSubview:ima];
    [ima mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.equalTo(bgview);
        make.top.equalTo(bgview).offset(110);
        make.size.mas_equalTo(CGSizeMake(85, 20));
    }];
    
    
    self.timeHour =[UILabel new];
    NSString * timeSt =[AppUtil getCurrentTime];
    self.timeHour.attributedText = [ClockViewController TimeArString:timeSt];
    self.timeHour.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.timeHour];
    
    [self.timeHour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ima.mas_bottom).offset(9);
        make.centerX.equalTo(bgview);
        make.size.mas_equalTo(CGSizeMake(266, 37));
    }];
    
    
     btn =[UIButton new];
    [btn setImage:[UIImage imageNamed:@"work_clock"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clock_btn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.timeHour.mas_bottom).offset(60);
        make.centerX.equalTo(bgview);
        make.size.mas_equalTo(CGSizeMake(109, 109));
        
        
        
    }];
    
    
    linefo =[UIImageView new];
    linefo.image =[UIImage imageNamed:@"clock_linefo"];
    [self.view addSubview:linefo];
    [linefo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(34);
        make.top.equalTo(bgview.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(1.5, 29));
    }];
    
    
    lineRt =[UIImageView new];
    lineRt.image =[UIImage imageNamed:@"work_gray_point"];
    [self.view addSubview:lineRt];
    [lineRt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(32);
        make.top.equalTo(bgview.mas_bottom).offset(29);
        make.size.mas_equalTo(CGSizeMake(7, 7));
        
    }];
    
    
    timeld =[UILabel new];
    NSString * strd = @"下班时间 17：30 (尚未打卡)";
    timeld.attributedText = [ClockViewController InputArString:strd];
    [self.view addSubview:timeld];
    [timeld mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineRt.mas_right).offset(6);
        make.top.equalTo(bgview.mas_bottom).offset(24);
        make.size.mas_equalTo(CGSizeMake(250, 15));
    }];
    
    
    aralboff =[UILabel new];
    aralboff.text =@"地点:五角大楼会议中心B20";
    aralboff.font = Ping_R(13);
    aralboff.hidden = YES;
    aralboff.textColor = RGB(170, 170, 170);
    [bgview addSubview:aralboff];
    [aralboff mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineR.mas_right).offset(6);
        make.top.equalTo(timeld.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(220, 12.5));
    }];
    
    
    
    [self GCDmehtod];
}



- (void)clock_btn:(UIButton * )sender
{
//     NSInteger str =[[[AppUtil getCurrentTime] substringWithRange:NSMakeRange(0, 2)] integerValue];
    
    // 今天第一次打卡
    if (self.isFirst) {
        
//        NSString * gotime =[[AppUtil getCurrentTime] substringWithRange:NSMakeRange(0, 5)];
        self.isFirst = NO;
        [self updateMansyGoOn];
    }else
    {
        self.isGoOff = YES;
        [self updateMansyGoOff];
        
    }

    
}

// ******************************************************更新约束 上班打卡***********************************************

- (void)updateMansyGoOn
{
    [bgview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineone.mas_bottom).offset(0);
        make.left.right.equalTo(self.view).offset(0);
        make.height.equalTo(@81);
        
    }];
    
    [ima mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgview);
        make.top.equalTo(bgview.mas_bottom).offset(117);
        make.size.mas_equalTo(CGSizeMake(85, 20));
    }];
    
    aralb.hidden = NO;
    lineR.image =[UIImage imageNamed:@"work_gray_point"];
    lineth.image =[UIImage imageNamed:@"clock_linetwo"];
    lineRt.image =[UIImage imageNamed:@"work_point"];
    linefo.image =[UIImage imageNamed:@"clock_lineone"];
    timelb.attributedText  = [ClockViewController InputArString:@"打卡时间 08:40 (上班时间 9:00)"];
    
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    
    
}


// ****************************************************** 更新约束 下班打卡***********************************************


- (void)updateMansyGoOff
{
    
    aralboff.hidden = NO;
    lineRt.image =[UIImage imageNamed:@"work_gray_point"];
    timelb.attributedText  = [ClockViewController InputArString:@"打卡时间 17:35 (下班时间 5:30)"];
    self.btn.userInteractionEnabled = NO;
    [self.btn setImage:[UIImage imageNamed:@"unclock"] forState:UIControlStateNormal];
    
    
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

+ (NSMutableAttributedString *)TimeArString:(NSString *)str
{
    NSDictionary *dic = @{NSKernAttributeName:@9.f};
    NSMutableAttributedString * aString =[[NSMutableAttributedString alloc]initWithString:str attributes:dic];
    [aString addAttribute:NSForegroundColorAttributeName value:RGB(94, 94, 94) range:NSMakeRange(0,6)];
    [aString addAttribute:NSForegroundColorAttributeName value:RGB(251, 155, 31) range:NSMakeRange(6,2)];
    [aString addAttribute:NSFontAttributeName value:Ping_M(49) range:NSMakeRange(0, 8)];
    return aString;
    
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
//    dispatch_cancel(self.timer);
    self.timer = nil;
    
}

- (void)doRightButtonTouch
{
    ClockHistoryViewController * VC =[[ClockHistoryViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
