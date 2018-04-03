

//
//  TendView.m
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "TendView.h"

@implementation TendView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.9];
        self.userInteractionEnabled = YES;
        
        
        UIView * DateChoose =[[UIView alloc]init];
        DateChoose.backgroundColor =[UIColor whiteColor];
        DateChoose.layer.masksToBounds = YES;
        DateChoose.layer.cornerRadius =5;
        [self addSubview:DateChoose];
        
        [DateChoose mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-40);
            make.size.mas_equalTo(CGSizeMake(346, 279));
            
        }];
        
        
        UILabel * ln =[UILabel new];
        ln.text =@"审核";
        ln.font = Ping_R(14);
        ln.textColor = Gray_color_47;
        [DateChoose addSubview:ln];
        [ln mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(28, 14));
            make.left.equalTo(DateChoose).offset(12);
            make.top.equalTo(DateChoose).offset(11);
        }];
        
        
        
        UIButton * de =[UIButton new];
        [de setImage:[UIImage imageNamed:@"home_vc_de"] forState:UIControlStateNormal];
        [de addTarget:self action:@selector(de_btn) forControlEvents:UIControlEventTouchUpInside];
        [DateChoose addSubview:de];
        [de mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(12, 12));
            make.right.equalTo(DateChoose).offset(-12);
            make.top.equalTo(DateChoose).offset(11);
        }];
        
        
        UITextView *tex =[UITextView new];
        tex.placeholder =@"请输入通过或拒绝通过原因";
        tex.backgroundColor = Gray_color_240;
        tex.limitLength =[NSNumber numberWithInteger:200];
        [DateChoose addSubview:tex];
        
        [tex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ln.mas_bottom).offset(13);
            make.size.mas_equalTo(CGSizeMake(324, 168));
            make.left.equalTo(DateChoose).offset(11);
            make.right.equalTo(DateChoose).offset(-11);
        }];
        
        NSMutableArray * arrUn =[[NSMutableArray alloc]initWithObjects:@"date_un",@"date_in", nil];
        NSMutableArray * Unarr =[NSMutableArray new];
        
        for (NSInteger i = 0; i<2; i++) {
            // <
            UIButton * btn =[UIButton new];
            [btn setImage:[UIImage imageNamed:arrUn[0]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(Un_touch:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 1050+i;
            [Unarr addObject:btn];
            [self addSubview:btn];
        }
        [Unarr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:38 leadSpacing:35 tailSpacing:36];
        [Unarr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(tex.mas_bottom).offset(20);
            make.height.equalTo(@37);
        }];

        
        
        
        
    }
    return self;
    
}

- (void)de_btn
{
    if (self.delegate) {
        [self.delegate deleTend];
    }
    
}

-(void)Un_touch:(UIButton *)sender
{
    NSInteger i = sender.tag-1050;
    if (i==0) {
        [self.delegate AllTend];
    }else
    {
        [self.delegate UnTend];
        
    }
    
}



@end
