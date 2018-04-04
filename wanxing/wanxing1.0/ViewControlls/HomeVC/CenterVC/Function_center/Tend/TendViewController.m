//
//  TendViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "TendViewController.h"

/*****************************************雅安监狱小结************************************* 1*/


@interface TendViewController ()
{
    TendView * tenALl;
    
}

@end

@implementation TendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"雅安监狱投标小结"];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"single_shen", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
    
    
}

- (void)SetupView
{
    [super SetupView];
    NSMutableArray * arrlb =[NSMutableArray arrayWithObjects:@"项目",@"投标轮次", nil];
    NSMutableArray  * arr =[[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<2; i++) {
        UILabel * lbe =[UILabel new];
        lbe.font = Ping_R(17);
        lbe.text = arrlb[i];
        lbe.textColor = Gray_color_b;
        [arr addObject:lbe];
        [self.view addSubview:lbe];
        
    }
    
    
    UILabel * lbe =[UILabel new];
    lbe.font = Ping_R(14);
    lbe.text = @"雅安监狱";
    lbe.textColor = Gray_color_128;
    [self.view addSubview:lbe];
    
    [lbe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(92);
        make.top.equalTo(self.view).offset(25);
        make.size.mas_equalTo(CGSizeMake(58, 14));
        
    }];
    
    UILabel * lineone =[UILabel new];
    lineone.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineone];
    [lineone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(55);
        make.height.equalTo(@0.7);
        
    }];
    
    UILabel * lbeone =[UILabel new];
    lbeone.font = Ping_R(14);
    lbeone.text = @"雅安监狱";
    lbeone.textColor = Gray_color_128;
    [self.view addSubview:lbeone];
    
    [lbeone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(92);
        make.top.equalTo(lineone.mas_bottom).offset(25);
        make.size.mas_equalTo(CGSizeMake(58, 14));
        
    }];
    
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:37 leadSpacing:20 tailSpacing:508];
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.width.equalTo(@75);
    }];
    
   
    
    
    UILabel * line =[UILabel new];
    line.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(110);
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
        make.top.equalTo(line.mas_bottom).offset(14);
        
    }];
    
    UITextView * textView =[UITextView new];
    
    textView.layer.borderColor = Gray_color_uibrother.CGColor;
    textView.layer.borderWidth = 1;
    textView.layer.cornerRadius =5;
    [self.view addSubview:textView];
    [self.view sendSubviewToBack:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(6);
        make.left.equalTo(lbl.mas_right).offset(12);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@100);
    }];
    textView.placeholder =@"请填写备注";
    textView.limitLength =[NSNumber numberWithInteger:200];
    
    
}

- (void)doRightButtonTouch
{
    tenALl =[[TendView alloc]init];
    tenALl.delegate = self;
    [self.view addSubview:tenALl];
    [self.view bringSubviewToFront:tenALl];
    
    [tenALl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.right.left.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
