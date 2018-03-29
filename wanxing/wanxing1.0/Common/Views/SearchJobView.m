//
//  SearchJobView.m
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "SearchJobView.h"

@implementation SearchJobView

@synthesize btnch;
@synthesize textWord;
@synthesize textPerson;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.9];
        self.userInteractionEnabled = YES;
        
        UIView * bg =[UIView new];
        bg.backgroundColor = [UIColor whiteColor];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.right.left.equalTo(self).offset(0);
            make.height.equalTo(@137);
        }];
        
        UILabel * lbm =[UILabel new];
        lbm.font  = Ping_R(13);
        lbm.text = NSLocalizedString(@"me_vc_word", nil);
        [self addSubview:lbm];
        [lbm mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(16);
            make.top.equalTo(self).offset(29);
            make.size.mas_equalTo(CGSizeMake(40, 13));
        }];
        
        UITextField *textField = [UITextField new];
        textField.text = @"点击试试";
        textField.layer.borderWidth =0.5;
        textField.layer.cornerRadius =2;
        textField.layer.borderColor =Gray_color_tt.CGColor;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.font = Ping_R(14);
        textField.delegate = self;
        [self addSubview:textField];
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbm.mas_right).offset(9);
            make.top.equalTo(self).offset(19);
            make.size.mas_equalTo(CGSizeMake(125, 30));
        }];
        
        
        UILabel * lby =[UILabel new];
        lby.font  = Ping_R(13);
        lby.text = NSLocalizedString(@"me_vc_state", nil);
        [self addSubview:lby];
        [lby mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(textField.mas_right).offset(17);
            make.top.equalTo(self).offset(27);
            make.size.mas_equalTo(CGSizeMake(30, 13.5));
        }];
        
        btnch =[UIButton new];
        [btnch setBackgroundImage:[UIImage imageNamed:@"do_log_box"] forState:UIControlStateNormal];
        [btnch setTitle:@"正在执行" forState:UIControlStateNormal];
        btnch.titleLabel.font =Ping_R(14);
        [btnch setTitleColor:Gray_color_b forState:UIControlStateNormal];
        [btnch addTarget:self action:@selector(pullbtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnch];
        
        [btnch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-12);
            make.top.equalTo(self).offset(19);
            make.size.mas_equalTo(CGSizeMake(125, 30));
        }];
        
        
        UILabel * lbth =[UILabel new];
        lbth.font  = Ping_R(13);
        lbth.text = NSLocalizedString(@"me_vc_person", nil);
        [self addSubview:lbth];
        [lbth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(16);
            make.top.equalTo(lbm.mas_bottom).offset(32);
            make.size.mas_equalTo(CGSizeMake(40, 13));
        }];
        
        
        UITextField *textField1 = [UITextField new];
        textField1.text = @"点击试试";
        textField1.layer.borderWidth =0.5;
        textField1.layer.cornerRadius =2;
        textField1.layer.borderColor =Gray_color_tt.CGColor;
        textField1.textAlignment = NSTextAlignmentCenter;
        textField1.font = Ping_R(14);
        textField1.delegate = self;
        [self addSubview:textField1];
        
        [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbth.mas_right).offset(9);
            make.top.equalTo(textField.mas_bottom).offset(19);
            make.size.mas_equalTo(CGSizeMake(125, 30));
        }];
        
        
        
        UIButton * SraBtn =[UIButton new];
        [SraBtn addTarget:self action:@selector(Search_btn:) forControlEvents:UIControlEventTouchUpInside];
        [SraBtn setTitle:NSLocalizedString(@"clock_search", nil) forState:UIControlStateNormal];
        [SraBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];\
        SraBtn.titleLabel.font = Ping_B(14);
        SraBtn.backgroundColor = Green_color;
        [self addSubview:SraBtn];
        [SraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-16);
            make.size.mas_equalTo(CGSizeMake(121, 36));
            make.centerY.equalTo(textField1);
        }];
        
        
    }
    return self;
    
}

- (void)Search_btn:(UIButton *)sender
{
    if (self.delegate) {
        [self.delegate SeacrchJob];
    }
    
    
}

- (void)pullbtn:(UIButton *)sender
{
    
    
}

@end
