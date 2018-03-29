//
//  AddViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "AddViewController.h"
#import "pickDateView.h"
#import "UITextView+PearNumview.h"




@interface AddViewController ()<ChooseViewDelegate,UITextViewDelegate>

@property(nonatomic,strong)NSMutableArray * arr;
@property(nonatomic,strong)NSMutableArray * arrLb;
@property(nonatomic,strong)NSMutableArray * arrLine;
@property(nonatomic,strong)pickDateView * pickV;





@end

@implementation AddViewController
@synthesize lblePerson;
@synthesize lbleEndTime;
@synthesize lbleStartTime;
@synthesize textTa;
@synthesize btnDown;
@synthesize choosePerson;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"me_vc_add", nil)];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"me_vc_add_f", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
    
   
    
    
}
 - (void)SetupView
{
    [super SetupView];
    
    self.arr =[[NSMutableArray alloc]initWithObjects:@"任务名称",@"选择人员",@"开始时间",@"结束时间", nil];
    self.arrLb =[NSMutableArray new];
    self.arrLine =[NSMutableArray new];
    for (NSInteger i = 0; i<4; i++) {
        // 文字
        UILabel * lb =[UILabel new];
        lb.text = self.arr[i];
        lb.textColor = RGB(47, 47, 47);
        lb.font = Ping_R(17);
        [self.arrLb addObject:lb];
        [self.view addSubview:lb];
        // 线条
        UILabel * lbline =[UILabel new];
        [lbline setBackgroundColor:[UIColor grayColor]];
        lbline.alpha =0.5;
        [self.arrLine addObject:lbline];
        [self.view addSubview:lbline];
        
    }
    
    [self.arrLb mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:39 leadSpacing:20.5 tailSpacing:400];
    [self.arrLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(11);
        make.width.equalTo(@125);
        
    }];
    
    [self.arrLine mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:55 leadSpacing:55 tailSpacing:380];
    [self.arrLine mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view).offset(9);
        make.right.equalTo(self.view).offset(-9);
    }];
    
    textTa = [UITextField new];
    textTa.placeholder =@"请填写任务名称";
    textTa.textAlignment = NSTextAlignmentCenter;
    textTa.font = Ping_R(14);
    textTa.delegate = self;
    [self.view addSubview:textTa];


    [textTa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(92);
        make.top.equalTo(self.view).offset(25);
        make.size.mas_equalTo(CGSizeMake(125, 13));
    }];

    UIButton * btnd =[UIButton new];
    [btnd setImage:[UIImage imageNamed:@"task_d"] forState:UIControlStateNormal];
    [btnd addTarget:self action:@selector(opneBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnd];

    [btnd mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(self.view).offset(-14);
        make.top.equalTo(self.view).offset(76);
        make.size.mas_equalTo(CGSizeMake(9.5, 16));
    }];
    

    lblePerson =[UILabel new];
    lblePerson.font = Ping_R(14);
    lblePerson.textColor = RGB(47, 47, 47);
    lblePerson.text =@"小鱼儿";
    lblePerson.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:lblePerson];
    [lblePerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btnd.mas_left).offset(-8.5);
        
        make.centerY.equalTo(btnd);
        make.size.mas_equalTo(CGSizeMake(70, 14));

    }];
    
     // 第三行
    
    UIButton * btnUp =[UIButton new];
    [btnUp setImage:[UIImage imageNamed:@"task_up"] forState:UIControlStateNormal];
    [btnUp setImage:[UIImage imageNamed:@"task_down"] forState:UIControlStateSelected];
    [btnUp addTarget:self action:@selector(task_up_f:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnUp];
    
    [btnUp  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(127);
        make.right.equalTo(self.view).offset(-11.5);
        make.size.mas_equalTo(CGSizeMake(18.5, 18.5));
    }];
    
    lbleStartTime =[UILabel new];
    lbleStartTime.text =@"2018-03-04 9:00";
    lbleStartTime.font = Ping_R(12);
    lbleStartTime.textColor = RGB(128, 128, 128);
    [self.view addSubview:lbleStartTime];
    
    [lbleStartTime mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(btnUp.mas_left).offset(8.5);
        make.size.mas_equalTo(CGSizeMake(118, 19));
        make.centerY.equalTo(btnUp);
    
        
    }];
    
    //  第四行
    
     btnDown =[UIButton new];
    [btnDown setImage:[UIImage imageNamed:@"task_up"] forState:UIControlStateNormal];
    [btnDown setImage:[UIImage imageNamed:@"task_down"] forState:UIControlStateSelected];
    [btnDown addTarget:self action:@selector(task_up:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDown];
    
    [btnDown  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(190 );
        make.right.equalTo(self.view).offset(-11.5);
        make.size.mas_equalTo(CGSizeMake(18.5, 18.5));
    }];
    
    
    lbleEndTime =[UILabel new];
    lbleEndTime.text =@"2018-03-04 9:00";
    lbleEndTime.font = Ping_R(12);
    lbleEndTime.textColor = RGB(128, 128, 128);
    [self.view addSubview:lbleEndTime];
    
    
    self.pickV =[[pickDateView alloc]init];
    self.pickV.isOpen = YES;
    [self.view addSubview:_pickV];
    
    [self NochangeLalout];
    
    
    UILabel * lb =[UILabel new];
    lb.text = @"是否发送";
    lb.textColor = RGB(47, 47, 47);
    lb.font = Ping_R(17);
    [self.view addSubview:lb];
    
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(11);
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.top.equalTo(self.view).offset(403);
    }];
    NSArray *array = [NSArray arrayWithObjects:@"是",@"否", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    segment.tintColor = RGB(9, 177 , 239);
    [self.view addSubview:segment];
    
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.size.mas_equalTo(CGSizeMake(97, 29));
        make.left.equalTo(lb.mas_right).offset(10);
        make.centerY.equalTo(lb);
    }];
    
    // 线
    UILabel * line =[UILabel new];
    line.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(segment.mas_bottom).offset(9);
        make.left.and.right.equalTo(self.view).offset(0);
        make.height.equalTo(@5);
        
    }];
    
    
    UILabel * lbl =[UILabel new];
    lbl.text = @"备注内容";
    lbl.textColor = RGB(47, 47, 47);
    lbl.font = Ping_R(17);
    [self.view addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(11);
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.top.equalTo(self.view).offset(458);
        
    }];
    
    UITextView * textView =[UITextView new];
   
    textView.layer.borderColor = Gray_color_uibrother.CGColor;
    textView.layer.borderWidth = 1;
    textView.layer.cornerRadius =5;
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(6);
        make.left.equalTo(lbl.mas_right).offset(12);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@100);
        
    }];
    textView.placeholder =@"请填写备注";
    textView.limitLength =[NSNumber numberWithInteger:200];


    
    
   
    
}

- (void)change:(UISegmentedControl *)dex
{
    if (dex.selectedSegmentIndex == 0) {
        FuckLog(@"是");
        
    }else
    {
        FuckLog(@"否");
        
    }
    
}


- (void)NochangeLalout
{
    [lbleEndTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btnDown.mas_left).offset(8.5);
        make.size.mas_equalTo(CGSizeMake(118, 19));
        make.centerY.equalTo(btnDown);
        
        
    }];
    
    [self.pickV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view).offset(0);
        make.height.equalTo(@186);
        make.top.equalTo(lbleEndTime.mas_bottom).offset(13);
    }];
    
}


- (void)task_up_f:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.pickV.hidden = NO;
        [self.pickV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.view).offset(0);
            make.height.equalTo(@186);
            make.top.equalTo(lbleStartTime.mas_bottom).offset(13);
        }];
        
        [btnDown mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pickV.mas_bottom).offset(20 );
            make.right.equalTo(self.view).offset(-11.5);
            make.size.mas_equalTo(CGSizeMake(18.5, 18.5));
        }];
        

    }else
    {
        self.pickV.hidden = YES;
    }
    
}

-(void)task_up:(UIButton *)sender
{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.pickV.hidden = YES;
        
        
    }else
    {
        self.pickV.hidden = NO;
        [self.pickV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.view).offset(0);
            make.height.equalTo(@186);
            make.top.equalTo(lbleEndTime.mas_bottom).offset(13);
        }];
    }
    
   
    
}

// 展开
- (void)opneBtn:(UIButton *)sender
{
    
    choosePerson =[[ChooseView alloc]init];
    choosePerson.delegate = self;
    [self.view addSubview:choosePerson];
    [choosePerson mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
}


#pragma MARK---------------------choose协议

- (void)SureC
{
    
    [choosePerson removeFromSuperview];
}
- (void)CanceC
{
    
    [choosePerson removeFromSuperview];
}


#pragma mark    ----- textview


- (void)doRightButtonTouch
{
    
    FuckLog(@"完成");
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
